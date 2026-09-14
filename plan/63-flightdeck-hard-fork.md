# 63 — FlightDeck hard fork

## Contexto

FlightDeck passa a ser a única identidade do desktop: produto, código, protocolo local,
CLI, sidecar, metadados, distribuição e estado no disco. Não haverá alias de
compatibilidade com a marca anterior; manter duas identidades prolongaria exatamente o
estado ambíguo que este fork quer encerrar.

A troca não pode apagar o estado local existente nem alterar workspaces do dd-swarm ou
máquinas remotas. Dados locais são migrados uma vez durante a instalação supervisionada.
Estado legado em hosts remotos fica fora desta operação; o cliente instala o novo sidecar
normalmente quando voltar a conectar.

O conserto de preservação de pins remotos é independente do rebrand e deve permanecer
num commit pequeno e revisável.

## Estrutura esperada

- `flightdeck/` — único subprojeto desktop; pacote, módulos e símbolos internos seguem a
  identidade FlightDeck.
- `flightdeck/packages/flightdeck_{core,protocol,engine,remote,server}/` — pacotes Dart.
- `flightdeck/plugins/flightdeck_pty/` — plugin PTY.
- `flightdeck` — CLI canônica; `deck` é o atalho curto para ela.
- `flightdeck-server` e recursos `flightdeck-*` — sidecar e bundles.
- `~/.flightdeck/` e `<Documents>/flightdeck/` — estado local.
- `~/Applications/FlightDeck.app` — único bundle do produto, real e validado.
- `dev.flightdeck.desktop` — bundle ID release (`.debug` apenas em debug).
- `scripts/build-flightdeck.sh` e `scripts/flightdeck-dispatch.sh` — únicos scripts do
  produto.

## Passos

### 1. Isolar o conserto de pins

- `RemoteHostsController.addPin` devolve `(pin, created)` e não grava quando encontra o
  mesmo ID ou `(hostId,path)`.
- `FlightDeckViewModel.createRemoteWorkspace` (renomeado na etapa 2) propaga o ID real do
  pin e `created`.
- A CLI aplica `--name` somente se `created`; a lógica anterior de abrir terminal vazio
  continua valendo tanto para pin novo quanto reutilizado.
- Testar que pin reutilizado preserva nome, cor, imagem, realm e ordem, sem `savePin`, e
  que pin novo usa realm/ordem pedidos e grava uma vez.

**Aceite:** diff pequeno, teste focado verde e nenhuma mudança de marca, hooks ou build
misturada neste commit.

### 2. Renomear o repositório inteiro

Fazer uma única passagem coordenada sobre caminhos e conteúdo rastreados, incluindo:

- diretório raiz do subprojeto, imports Dart, classes, chaves i18n e código gerado;
- pacotes, plugin PTY, crate/binário CLI, servidor, recursos e scripts de build;
- macOS/iOS/Android/Linux/Windows, bundle/application IDs e projetos Xcode;
- workflows, tags/artefatos de release, site, assets, docs, planos, scouts e instruções de
  orquestração;
- diretórios de projeto, sockets, variáveis de ambiente, skill e instaladores de hooks.

Os instaladores de hooks continuam existindo: o conserto de ownership já evita que filhos
ou terminais externos reportem ao app errado. O rebrand troca nomes/paths sem remover a
feature.

Use `git mv` para caminhos rastreados. Não tocar no `Podfile.lock` salvo para resolver
ruído de versão do CocoaPods. Não editar subprojetos ou VMs do dd-swarm.

**Aceite:** fora de `.git`, não existe ocorrência case-insensitive do token legado em nome
de arquivo, diretório ou conteúdo rastreado. A auditoria evita registrar o token inteiro no
próprio plano:

```bash
legacy='cock''pit'
git ls-files | grep -i "$legacy"
git grep -Iin "$legacy"
find . -path ./.git -prune -o -iname "*$legacy*" -print
```

Os três comandos não imprimem nada.

### 3. Build e instalação determinísticos

`scripts/build-flightdeck.sh` tem dois modos explícitos:

- default: compila e valida sem modificar `~/Applications` nem `~/.flightdeck`;
- `--install`: compila, valida assinatura/bundle ID/executável, copia para staging no
  mesmo filesystem e instala um bundle real em `~/Applications/FlightDeck.app`.

Somente depois do staging validado o modo install encerra a versão antiga, troca o bundle
canônico, remove bundles antigos/build/temp/backups do produto e instala CLI + shims. Um
`trap` limpa staging em falha. Nada aponta por symlink para `build/`.

**Aceite:** flags inválidas falham; build puro não altera o estado instalado
(`~/Applications`, `~/.flightdeck` ou hooks globais); install falho conserva o app
anterior; install bem-sucedido deixa um único bundle do produto.

### 4. Migrar estado local sem perda

Com o app antigo encerrado, copiar/mover o estado local para a nova raiz antes do primeiro
launch. Se origem e destino têm dados, comparar e parar para revisão — nunca sobrescrever.
Depois de validar no FlightDeck os projetos, realms, layouts, pins e preferências, remover:

- raiz de estado local legada e ponteiro legado;
- Application Support, Preferences, HTTP storage e CrashReporter do bundle ID antigo;
- CLI, skill e extensão de hook antigas;
- registros antigos do LaunchServices.

Credenciais SSH guardadas no Keychain exigem rekey separado: nunca imprimir segredos e
não apagar entradas antigas até confirmar que a credencial equivalente funciona sob a
nova identidade. Se a plataforma não permite migrar sem expor o segredo, parar e pedir
que o usuário a informe novamente.

Não varrer/apagar pastas arbitrárias pelo nome. Só remover paths comprovadamente criados
pelo produto. Não tocar em estado remoto.

**Aceite:** hashes/contagens dos JSONs migrados conferem antes do cleanup e o app abre com
o estado esperado.

### 5. Validação

Rodar no subprojeto já renomeado:

- teste focado de pins;
- suíte do host shell (inclui zsh real);
- testes da CLI Rust e pacotes Dart afetados;
- `flutter analyze lib/`;
- `flutter test` relevante e build macOS release.

No bundle instalado, verificar:

- `CFBundleIdentifier = dev.flightdeck.desktop`;
- assinatura válida;
- executável e recursos só usam nomes FlightDeck;
- CLI `flightdeck` e `deck` apontam para o mesmo binário canônico;
- exatamente um processo GUI do produto e sidecar correspondente;
- nenhum DMG montado nem bundle `.app` de build, backup, staging ou nome antigo;
- origin é `Scott-Meyer/remote_pi`; nada foi enviado ao upstream.

## Definition of Done

- [ ] Conserto de pins isolado, testado e assinado.
- [ ] Todos os caminhos e conteúdos rastreados usam FlightDeck.
- [ ] Pacotes, CLI, sidecar, protocolo local, hooks e distribuição usam FlightDeck.
- [ ] Estado local migrado e validado sem perda.
- [ ] Build/test/analyze verdes.
- [ ] Único bundle: `~/Applications/FlightDeck.app` (`dev.flightdeck.desktop`).
- [ ] Única GUI em execução é a build mais recente do fork.
- [ ] Auditoria de filesystem, processos, mounts e LaunchServices limpa.
- [ ] Commits assinados e enviados apenas para o `origin` do fork.

## Próximos planos

Nenhum. Correções encontradas na validação entram antes de encerrar este plano.

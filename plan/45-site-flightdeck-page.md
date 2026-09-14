# 45 — Site: página de produto do FlightDeck (`/flightdeck`)

## Contexto

O FlightDeck ganhou release pública (plano 43), mas o site só o oferta na página
utilitária `/download`. Falta uma página que **venda** o produto. Insumo de
copy: brief honesto produzido pelo agente do FlightDeck em
`.orchestration/results/45-flightdeck-app-brief.md` (verificado contra o código).

### Decisões (discussão 2026-06-12)

| Tema | Decisão |
|---|---|
| Ângulo do hero | **Multi-agente lado a lado** — "rode vários agentes de uma vez"; o multiplexador (agentes + terminais em painéis) é o coração e o diferencial |
| Navegação | `/flightdeck` vira **porta de entrada**: card "FlightDeck" da home e novo item "FlightDeck" no header apontam pra ela; a página fecha com CTA pro `/download` (que segue como utilitária) |
| Idioma | **Inglês** (consistente com o site) |
| Hero visual | Screenshot real (`site/public/flightdeck-hero.png`, vindo de `branding/screenshot-app.png`) — multi-pane com 3 agentes, workspaces com worktrees, file tree |
| Seções extras | Spotlight **worktrees**; spotlight **daemons 24/7 + cron**; seção **mesh** (agentes locais e pareados conversando) |
| Mesh — enquadramento honesto | Mesh é capacidade do ecossistema (Pi + extensão remote-pi, que o onboarding do FlightDeck exige) demonstrada DENTRO do FlightDeck — não é feature interna do app. Não prometer: controle remoto dos panes pelo celular, visualizador de rede |
| Não prometer (brief §4) | Auto-update, edição de arquivos no app, Windows/Linux "totalmente validados" |

## Definition of Done

- [x] Página `/flightdeck` em inglês: hero (ângulo multi-agente + screenshot), grade de features (brief §2), spotlights worktrees e daemons+cron, seção mesh (enquadramento honesto), CTA final pro `/download`
- [x] Header com item "FlightDeck"; card "FlightDeck" da home apontando pra `/flightdeck`
- [ ] `pnpm lint && pnpm build` verdes
- [ ] Site republicado (imagem Docker) e página validada em produção

# Project-level configuration.
cmake_minimum_required(VERSION 3.13)
project(runner LANGUAGES CXX)

# The name of the executable created for the application. Change this to change
# the on-disk name of your application.
set(BINARY_NAME "flightdeck")
# The unique GTK application identifier for this application. See:
# https://wiki.gnome.org/HowDoI/ChooseApplicationID
set(APPLICATION_ID "dev.flightdeck.desktop")

# Explicitly opt in to modern CMake behaviors to avoid warnings with recent
# versions of CMake.
cmake_policy(SET CMP0063 NEW)

# Load bundled libraries from the lib/ directory relative to the binary.
set(CMAKE_INSTALL_RPATH "$ORIGIN/lib")

# Root filesystem for cross-building.
if(FLUTTER_TARGET_PLATFORM_SYSROOT)
  set(CMAKE_SYSROOT ${FLUTTER_TARGET_PLATFORM_SYSROOT})
  set(CMAKE_FIND_ROOT_PATH ${CMAKE_SYSROOT})
  set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
  set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
  set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
  set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
endif()

# Define build configuration options.
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  set(CMAKE_BUILD_TYPE "Debug" CACHE
    STRING "Flutter build mode" FORCE)
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS
    "Debug" "Profile" "Release")
endif()

# Compilation settings that should be applied to most targets.
#
# Be cautious about adding new options here, as plugins use this function by
# default. In most cases, you should add new options to specific targets instead
# of modifying this function.
function(APPLY_STANDARD_SETTINGS TARGET)
  target_compile_features(${TARGET} PUBLIC cxx_std_14)
  target_compile_options(${TARGET} PRIVATE -Wall -Werror)
  target_compile_options(${TARGET} PRIVATE "$<$<NOT:$<CONFIG:Debug>>:-O3>")
  target_compile_definitions(${TARGET} PRIVATE "$<$<NOT:$<CONFIG:Debug>>:NDEBUG>")
endfunction()

# Flutter library and tool build rules.
set(FLUTTER_MANAGED_DIR "${CMAKE_CURRENT_SOURCE_DIR}/flutter")
add_subdirectory(${FLUTTER_MANAGED_DIR})

# System-level dependencies.
find_package(PkgConfig REQUIRED)
pkg_check_modules(GTK REQUIRED IMPORTED_TARGET gtk+-3.0)

# Application build; see runner/CMakeLists.txt.
add_subdirectory("runner")

# Run the Flutter tool portions of the build. This must not be removed.
add_dependencies(${BINARY_NAME} flutter_assemble)

# Only the install-generated bundle's copy of the executable will launch
# correctly, since the resources must in the right relative locations. To avoid
# people trying to run the unbundled copy, put it in a subdirectory instead of
# the default top-level location.
set_target_properties(${BINARY_NAME}
  PROPERTIES
  RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/intermediates_do_not_run"
)


# Generated plugin build rules, which manage building the plugins and adding
# them to the application.
include(flutter/generated_plugins.cmake)

# flutter_secure_storage_linux 1.x bundles an older nlohmann/json header. New
# Clang versions warn about its pre-C++14 literal-operator syntax; plugins share
# APPLY_STANDARD_SETTINGS, so our global -Werror turned that upstream warning
# into a build failure. Keep warnings-as-errors for the app and every other
# warning, but exempt this known third-party deprecation until the secure-storage
# package can be upgraded as a compatible set.
if(TARGET flutter_secure_storage_linux_plugin)
  target_compile_options(flutter_secure_storage_linux_plugin PRIVATE
    "$<$<CXX_COMPILER_ID:Clang>:-Wno-error=deprecated-literal-operator>")
endif()

# === Installation ===
# By default, "installing" just makes a relocatable bundle in the build
# directory.
set(BUILD_BUNDLE_DIR "${PROJECT_BINARY_DIR}/bundle")
if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
  set(CMAKE_INSTALL_PREFIX "${BUILD_BUNDLE_DIR}" CACHE PATH "..." FORCE)
endif()

# Start with a clean build bundle directory every time.
install(CODE "
  file(REMOVE_RECURSE \"${BUILD_BUNDLE_DIR}/\")
  " COMPONENT Runtime)

set(INSTALL_BUNDLE_DATA_DIR "${CMAKE_INSTALL_PREFIX}/data")
set(INSTALL_BUNDLE_LIB_DIR "${CMAKE_INSTALL_PREFIX}/lib")

install(TARGETS ${BINARY_NAME} RUNTIME DESTINATION "${CMAKE_INSTALL_PREFIX}"
  COMPONENT Runtime)

install(FILES "${FLUTTER_ICU_DATA_FILE}" DESTINATION "${INSTALL_BUNDLE_DATA_DIR}"
  COMPONENT Runtime)

install(FILES "${FLUTTER_LIBRARY}" DESTINATION "${INSTALL_BUNDLE_LIB_DIR}"
  COMPONENT Runtime)

foreach(bundled_library ${PLUGIN_BUNDLED_LIBRARIES})
  install(FILES "${bundled_library}"
    DESTINATION "${INSTALL_BUNDLE_LIB_DIR}"
    COMPONENT Runtime)
endforeach(bundled_library)

# Copy the native assets provided by the build.dart from all packages.
set(NATIVE_ASSETS_DIR "${PROJECT_BUILD_DIR}native_assets/linux/")
install(DIRECTORY "${NATIVE_ASSETS_DIR}"
   DESTINATION "${INSTALL_BUNDLE_LIB_DIR}"
   COMPONENT Runtime)

# Fully re-copy the assets directory on each build to avoid having stale files
# from a previous install.
set(FLUTTER_ASSET_DIR_NAME "flutter_assets")
install(CODE "
  file(REMOVE_RECURSE \"${INSTALL_BUNDLE_DATA_DIR}/${FLUTTER_ASSET_DIR_NAME}\")
  " COMPONENT Runtime)
install(DIRECTORY "${PROJECT_BUILD_DIR}/${FLUTTER_ASSET_DIR_NAME}"
  DESTINATION "${INSTALL_BUNDLE_DATA_DIR}" COMPONENT Runtime)

# Install the AOT library on non-Debug builds only.
if(NOT CMAKE_BUILD_TYPE MATCHES "Debug")
  install(FILES "${AOT_LIBRARY}" DESTINATION "${INSTALL_BUNDLE_LIB_DIR}"
    COMPONENT Runtime)
endif()

# === tool → flightdeck-hook + flightdeck-cli (helpers Dart AOT) ===
# Compila o helper de hook (status de turno do claude) e a CLI interna
# (send/send-key/list-panes/open) e os instala **ao lado do binário** (raiz do
# bundle, onde o [_bundledHelper] os procura). Em runtime o ClaudeHookInstaller
# os materializa em ~/.flightdeck/bin. Equivale ao build_hook.sh/build_cli.sh do
# macOS e ao bloco correspondente no windows/CMakeLists.txt.
if(DEFINED ENV{FLUTTER_ROOT})
  set(DART_EXE "$ENV{FLUTTER_ROOT}/bin/dart")
else()
  set(DART_EXE "dart")
endif()

set(FLIGHTDECK_HOOK_SRC "${CMAKE_SOURCE_DIR}/../tool/flightdeck_hook.dart")
set(FLIGHTDECK_HOOK_EXE "${CMAKE_BINARY_DIR}/flightdeck-hook")
add_custom_command(
  OUTPUT "${FLIGHTDECK_HOOK_EXE}"
  COMMAND "${DART_EXE}" compile exe "${FLIGHTDECK_HOOK_SRC}" -o "${FLIGHTDECK_HOOK_EXE}"
  DEPENDS "${FLIGHTDECK_HOOK_SRC}"
  COMMENT "Compilando flightdeck-hook"
  VERBATIM)
add_custom_target(flightdeck_hook ALL DEPENDS "${FLIGHTDECK_HOOK_EXE}")
install(PROGRAMS "${FLIGHTDECK_HOOK_EXE}" DESTINATION "${CMAKE_INSTALL_PREFIX}"
  COMPONENT Runtime)

# === cli/ → flightdeck-cli (CLI interna em Rust, com o hook como subcomando) ===
# A CLI absorveu o antigo helper `flightdeck-hook`: `flightdeck hook` faz o mesmo
# papel. Rust porque o `dart compile exe` sai de UMA arquitetura, não
# cross-compila e não sobrevive ao `lipo` — ver macos/build_cli.sh.
set(FLIGHTDECK_CLI_CRATE "${CMAKE_SOURCE_DIR}/../cli")
# O PATH do processo que roda o CMake nem sempre traz o `cargo` (IDE/launcher
# não herda o shell de login), então a instalação padrão do rustup entra como
# hint — mesma resolução do `resolve_cargo` do macos/build_cli.sh. Falhar aqui,
# no configure, troca o "no such file or directory" do ninja por uma causa.
find_program(CARGO_EXECUTABLE cargo HINTS "$ENV{HOME}/.cargo/bin")
if(NOT CARGO_EXECUTABLE)
  message(FATAL_ERROR
    "'cargo' não encontrado: a CLI interna (cli/) é um crate Rust e faz parte "
    "do build. Instale o Rust (https://rustup.rs) e rode o build de novo.")
endif()
# `build.rs` entra na lista: é ele que assa o flavor no binário, e uma
# mudança lá não mexe em `src/` — sem isto o CMake daria a CLI por
# atualizada. Mesma classe do glob do servidor logo abaixo.
file(GLOB_RECURSE FLIGHTDECK_CLI_SOURCES CONFIGURE_DEPENDS
  "${FLIGHTDECK_CLI_CRATE}/src/*.rs" "${FLIGHTDECK_CLI_CRATE}/text/*"
  "${FLIGHTDECK_CLI_CRATE}/build.rs")
set(FLIGHTDECK_CLI_BUILT "${FLIGHTDECK_CLI_CRATE}/target/release/flightdeck")
set(FLIGHTDECK_CLI_EXE "${CMAKE_BINARY_DIR}/flightdeck-cli")
# Flavor assado no binário (ver cli/build.rs): decide qual socket a CLI procura
# primeiro quando roda fora de um terminal do FlightDeck.
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
  set(FLIGHTDECK_CLI_FLAVOR "debug")
else()
  set(FLIGHTDECK_CLI_FLAVOR "release")
endif()
add_custom_command(
  OUTPUT "${FLIGHTDECK_CLI_EXE}"
  COMMAND "${CMAKE_COMMAND}" -E env "FLIGHTDECK_FLAVOR=${FLIGHTDECK_CLI_FLAVOR}"
          "${CARGO_EXECUTABLE}" build --release
          --manifest-path "${FLIGHTDECK_CLI_CRATE}/Cargo.toml"
  COMMAND "${CMAKE_COMMAND}" -E copy "${FLIGHTDECK_CLI_BUILT}" "${FLIGHTDECK_CLI_EXE}"
  DEPENDS ${FLIGHTDECK_CLI_SOURCES} "${FLIGHTDECK_CLI_CRATE}/Cargo.toml"
  COMMENT "Compilando flightdeck-cli (Rust)"
  VERBATIM)
add_custom_target(flightdeck_cli ALL DEPENDS "${FLIGHTDECK_CLI_EXE}")
install(PROGRAMS "${FLIGHTDECK_CLI_EXE}" DESTINATION "${CMAKE_INSTALL_PREFIX}"
  COMPONENT Runtime)

# === Desktop integration (nome + ícone para publicação) ===
# .desktop com Name=FlightDeck, e ícones do tema hicolor nomeados pelo
# APPLICATION_ID (dev.flightdeck.desktop) — é assim que o launcher/dock e a
# barra de tarefas resolvem nome e ícone do app empacotado (deb/AppImage/snap).
install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/flightdeck.desktop"
  DESTINATION "${CMAKE_INSTALL_PREFIX}/share/applications"
  RENAME "${APPLICATION_ID}.desktop"
  COMPONENT Runtime)

foreach(icon_size 64 128 256 512 1024)
  install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/runner/resources/app_icon_${icon_size}.png"
    DESTINATION "${CMAKE_INSTALL_PREFIX}/share/icons/hicolor/${icon_size}x${icon_size}/apps"
    RENAME "${APPLICATION_ID}.png"
    COMPONENT Runtime)
endforeach()

# AppStream metainfo — descreve o app pra centros de software/empacotadores.
install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/${APPLICATION_ID}.metainfo.xml"
  DESTINATION "${CMAKE_INSTALL_PREFIX}/share/metainfo"
  COMPONENT Runtime)

# === flightdeck-server (sidecar) ===
# Bundle `bin/` + `lib/` do servidor headless, instalado AO LADO do executável
# (mesmo lugar do flightdeck-hook e da flightdeck-cli; o deb/rpm empacota o prefixo
# inteiro). Equivale ao Run Script do macOS (build_server.sh); sem isto o app
# cai no fallback in-process e o Linux roda uma arquitetura diferente do macOS.
#
# `dart build cli` NÃO cross-compila, mas aqui não é problema: o CI compila cada
# arquitetura no seu próprio runner nativo (x64 e arm64).
set(FLIGHTDECK_SERVER_PKG "${CMAKE_SOURCE_DIR}/../packages/flightdeck_server")
set(FLIGHTDECK_SERVER_DIR "${CMAKE_BINARY_DIR}/server-bundle")
set(FLIGHTDECK_SERVER_EXE "${FLIGHTDECK_SERVER_DIR}/bin/flightdeck-server")
# O servidor NÃO é só o pacote dele: depende dos irmãos por `path:`
# (flightdeck_core, flightdeck_engine, flightdeck_protocol). Com o glob olhando só
# `flightdeck_server/`, editar o engine não invalidava nada e o CMake dava o
# bundle por atualizado — o build saía com um `flightdeck-server` VELHO, em
# silêncio. Mesmo ajuste do windows/CMakeLists.txt.
file(GLOB_RECURSE FLIGHTDECK_SERVER_SOURCES CONFIGURE_DEPENDS
  "${FLIGHTDECK_SERVER_PKG}/bin/*.dart" "${FLIGHTDECK_SERVER_PKG}/lib/*.dart"
  "${FLIGHTDECK_SERVER_PKG}/../flightdeck_core/lib/*.dart"
  "${FLIGHTDECK_SERVER_PKG}/../flightdeck_engine/lib/*.dart"
  "${FLIGHTDECK_SERVER_PKG}/../flightdeck_protocol/lib/*.dart")
add_custom_command(
  OUTPUT "${FLIGHTDECK_SERVER_EXE}"
  # Bundle limpo: `dart build cli` recusa diretório de saída já existente.
  COMMAND "${CMAKE_COMMAND}" -E rm -rf "${FLIGHTDECK_SERVER_DIR}" "${CMAKE_BINARY_DIR}/server-out"
  COMMAND "${CMAKE_COMMAND}" -E chdir "${FLIGHTDECK_SERVER_PKG}" "${DART_EXE}" pub get
  COMMAND "${CMAKE_COMMAND}" -E chdir "${FLIGHTDECK_SERVER_PKG}" "${DART_EXE}" build cli
          -o "${CMAKE_BINARY_DIR}/server-out"
  # `dart build cli` gera <out>/bundle/{bin,lib}; o exe sai com underscore.
  COMMAND "${CMAKE_COMMAND}" -E copy_directory
          "${CMAKE_BINARY_DIR}/server-out/bundle" "${FLIGHTDECK_SERVER_DIR}"
  COMMAND "${CMAKE_COMMAND}" -E rename
          "${FLIGHTDECK_SERVER_DIR}/bin/flightdeck_server" "${FLIGHTDECK_SERVER_EXE}"
  # A lib do PTY vai ao LADO do exe do servidor: é o 2º candidato do
  # openPtyDylib (o 1º é a env FLIGHTDECK_PTY_DYLIB, que o sidecar preenche).
  # Reusa o artefato do plugin em vez de compilar o mesmo .c duas vezes.
  COMMAND "${CMAKE_COMMAND}" -E copy
          "$<TARGET_FILE:flightdeck_pty>" "${FLIGHTDECK_SERVER_DIR}/bin/"
  # CLI embarcada ao lado do servidor (plano 60, Wave G): o servidor instala o
  # hook do agente apontando pra ela, e a acha na mesma pasta bin/.
  COMMAND "${CMAKE_COMMAND}" -E copy
          "${FLIGHTDECK_CLI_EXE}" "${FLIGHTDECK_SERVER_DIR}/bin/flightdeck"
  DEPENDS ${FLIGHTDECK_SERVER_SOURCES} "${FLIGHTDECK_SERVER_PKG}/pubspec.yaml"
          "${FLIGHTDECK_CLI_EXE}" flightdeck_pty
  COMMENT "Compilando flightdeck-server (bundle do sidecar)"
  VERBATIM)
add_custom_target(flightdeck_server ALL DEPENDS "${FLIGHTDECK_SERVER_EXE}")
install(DIRECTORY "${FLIGHTDECK_SERVER_DIR}/"
  DESTINATION "${CMAKE_INSTALL_PREFIX}/flightdeck-server-bundle"
  USE_SOURCE_PERMISSIONS COMPONENT Runtime)

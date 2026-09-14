#!/usr/bin/env bash
# Wave 0 (plano 58) — gate FFI: compila o flightdeck_pty como dylib standalone,
# fora do build do Flutter, para consumo via DynamicLibrary.open em Dart puro.
# Saída: flightdeck/build/wave0/libflightdeck_pty.dylib (ou .so no Linux).
set -euo pipefail

cd "$(dirname "$0")/../.."
SRC=plugins/flightdeck_pty/src
OUT=build/wave0
mkdir -p "$OUT"

case "$(uname -s)" in
  Darwin)
    cc -dynamiclib -O2 -DDART_SHARED_LIB \
      -o "$OUT/libflightdeck_pty.dylib" "$SRC/flightdeck_pty.c" -I"$SRC" -lpthread
    echo "ok: $OUT/libflightdeck_pty.dylib"
    ;;
  Linux)
    cc -shared -fPIC -O2 -DDART_SHARED_LIB \
      -o "$OUT/libflightdeck_pty.so" "$SRC/flightdeck_pty.c" -I"$SRC" -lpthread
    echo "ok: $OUT/libflightdeck_pty.so"
    ;;
  *)
    echo "wave0: plataforma não suportada pelo script ($(uname -s))" >&2
    exit 1
    ;;
esac

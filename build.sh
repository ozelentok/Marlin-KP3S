#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
BUILD_PATH="$SCRIPT_DIR/.pio"
REAL_BUILD_PATH="/tmp/build/marlin"

mkdir -p "$REAL_BUILD_PATH"
if [ ! -L "$BUILD_PATH" ]; then
	ln -s "$REAL_BUILD_PATH" "$BUILD_PATH"
fi

platformio run -e mks_robin_nano_v1v2 -t compiledb
platformio run -e mks_robin_nano_v1v2
cd "$BUILD_PATH/build/mks_robin_nano_v1v2"
cp Robin_nano35.bin Robin_nano.bin

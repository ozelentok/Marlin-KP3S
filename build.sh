#!/bin/sh

set -e

SCRIPT_DIR=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
PIO_PATH="$SCRIPT_DIR/.pio"
BUILD_PATH="/tmp/build/marlin"

mkdir -p "$BUILD_PATH"
if [ ! -L "$SCRIPT_DIR/.pio" ]; then
	ln -s "$BUILD_PATH" "$PIO_PATH"
fi

platformio run -e mks_robin_nano_v1v2
cp "$PIO_PATH/build/mks_robin_nano_v1v2/Robin_nano35.bin" "$PIO_PATH/build/mks_robin_nano_v1v2/Robin_nano.bin"

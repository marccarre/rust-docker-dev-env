#!/bin/bash
SRC_DIR=${1:-/home/rust/src}
inotifywait -mr -e create,modify,delete \
        --exclude "^.*?[^\.][^r][^s]$" "$SRC_DIR" | while read -r _ event file; do
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $event on $file. Rebuilding now..." && cargo build
done

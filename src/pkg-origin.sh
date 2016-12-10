#!/bin/sh
set -eu

while read pkg; do
    pkg info "$pkg" | grep Origin | cut -d ':' -f2 | tr -d ' '
done

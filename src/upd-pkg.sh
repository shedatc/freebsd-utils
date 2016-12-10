#!/bin/sh
set -eu

if [ "$(id -u)" != '0' ]; then
    echo 'ERROR: Must be run as root.' 1>&2
    exit 64 # EX_USAGE, see FreeBSD's sysexits(3).
fi

while read port; do
    dir="/usr/ports/$port"
    if ! [ -d "$dir" ]; then
        echo "E: $dir is not a directory"
        continue
    fi
    echo "I: Updating $port..."
    cd "$dir"
    make clean build deinstall reinstall
done

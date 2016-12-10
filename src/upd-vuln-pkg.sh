#!/bin/sh
set -eu

pkg_list="$(mktemp -t upd-vuln-pkg.XXXXXXXX)"
vuln-pkg | pkg-origin > "$pkg_list"
if [ -s "$pkg_list" ]; then
    echo 'The following packages are vulnerable:'
    cat $pkg_list | sed 's/^/  /1'
    sudo portsnap update
    cat $pkg_list | sudo upd-pkg
fi
rm $pkg_list

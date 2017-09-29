#!/bin/sh
set -eu
#hello
pkg audit | grep ' is vulnerable:' | cut -d ' ' -f1 | sort -u

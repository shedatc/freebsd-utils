#!/bin/sh
set -eu

pkg audit | grep ' is vulnerable:' | cut -d ' ' -f1 | sort -u

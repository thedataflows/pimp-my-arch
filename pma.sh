#!/bin/env bash

set -u -e -o pipefail

trap 'echo [ERROR] $BASH_SOURCE failed at line $LINENO with retcode $?' ERR TERM

if ! pacman-key --list-keys &>/dev/null; then
  pacman-key --init
  pacman-key --populate archlinux
fi

type go-task &>/dev/null || pacman -Sy --noconfirm --needed go-task

cd "${0%/*}"
go-task "$@"

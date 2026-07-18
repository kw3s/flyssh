#!/bin/bash

set -e

if ! id sshuser >/dev/null 2>&1; then
    useradd -m sshuser
    echo "sshuser:ChangeMe123!" | chpasswd
fi

mkdir -p /var/run/sshd

exec /usr/sbin/sshd -D -e

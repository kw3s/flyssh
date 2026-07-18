#!/bin/bash
set -e

if ! id sshuser >/dev/null 2>&1; then
    useradd -m sshuser
    echo "sshuser:ChangeMe123!" | chpasswd
fi

mkdir -p /var/run/sshd

# Generate host keys if they don't already exist
ssh-keygen -A

exec /usr/sbin/sshd -D -e

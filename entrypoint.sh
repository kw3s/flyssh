#!/bin/bash
set -e

if ! id sshuser >/dev/null 2>&1; then
    useradd -m sshuser
    mkdir -p /home/sshuser/.ssh
    echo "$SSH_PUBLIC_KEY" > /home/sshuser/.ssh/authorized_keys
    chown -R sshuser:sshuser /home/sshuser/.ssh
    chmod 700 /home/sshuser/.ssh
    chmod 600 /home/sshuser/.ssh/authorized_keys
fi
mkdir -p /var/run/sshd

# Generate host keys if they don't already exist
ssh-keygen -A

exec /usr/sbin/sshd -D -e

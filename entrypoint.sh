#!/bin/bash
set -e

if ! id sshuser >/dev/null 2>&1; then
    useradd -m sshuser
fi

mkdir -p /home/sshuser/.ssh
echo "$SSH_PUBLIC_KEY" > /home/sshuser/.ssh/authorized_keys
chown -R sshuser:sshuser /home/sshuser/.ssh
chmod 700 /home/sshuser/.ssh
chmod 600 /home/sshuser/.ssh/authorized_keys

mkdir -p /var/run/sshd
ssh-keygen -A

exec /usr/sbin/sshd -D -e

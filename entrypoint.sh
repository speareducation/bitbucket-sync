#!/bin/bash
set -x
sudo su

ls -la

mkdir -p ~/.ssh
echo "$INPUT_ID_RSA" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

echo "
Host bitbucket.org
  IdentityFile ~/.ssh/id_rsa
" >> ~/.ssh/config

git remote set-url origin "$INPUT_REPOSITORY"

git push origin "$(git rev-parse --abbrev-ref HEAD)"
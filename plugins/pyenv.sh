#!/bin/bash
echo "install required packages"
apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

echo "install pyenv"
curl https://pyenv.run | bash

echo 'export PYENV_ROOT="$HOME/.pyenv"' >>~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >>~/.zshrc
echo 'eval "$(pyenv init - zsh)"' >>~/.zshrc

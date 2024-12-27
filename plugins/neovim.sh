#!/bin/bash
echo "install neovim"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
rm -rf /opt/nvim
tar -C /opt -xzf nvim-linux64.tar.gz
ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim

rm -f nvim-linux64.tar.gz

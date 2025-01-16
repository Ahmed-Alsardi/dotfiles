#!/bin/bash

NVIM_CONFIG="$HOME/.config/nvim"

if [ -d "$NVIM_CONFIG" ]; then
  echo "Nvim config folder found, creating backup..."
  mv "$NVIM_CONFIG" "$NVIM_CONFIG.bak"
  echo "Backup created at $NVIM_CONFIG.bak"
fi

git clone https://github.com/Ahmed-Alsardi/LazyVim-starter.git $NVIM_CONFIG

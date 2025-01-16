#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Function to print status messages
print_status() {
  echo -e "${GREEN}[*] $1${NC}"
}

print_error() {
  echo -e "${RED}[ERROR] $1${NC}"
}

# Define the plugins array in the order you want them to be installed
plugins=(
  "neovim.sh"
  "golang.sh"
  "lazygit.sh"
  "lazyvim.sh"
  # Add more plugins in the order you want
)

# Update and upgrade system
print_status "Updating and upgrading system packages..."
apt update && apt upgrade -y

# Install standard packages
print_status "Installing standard packages..."
export DEBIAN_FRONTEND=noninteractive
apt install -y curl git wget build-essential unzip vim tree zsh eza

print_status "Setting timezone to Asia/Riyadh..."
sudo ln -sf /usr/local/share/zoneinfo/Asia/Riyadh /etc/localtime
sudo timedatectl set-timezone Asia/Riyadh

# Change default shell to zsh
print_status "Changing default shell to zsh..."
if [ "$SHELL" != "/usr/bin/zsh" ]; then
  chsh -s $(which zsh)
else
  print_status "zsh is already the default shell"
fi

# Backup existing .zshrc if it exists
if [ -f "$HOME/.zshrc" ]; then
  print_status "Backing up existing .zshrc..."
  mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

# Copy new .zshrc
print_status "Installing new .zshrc..."
cp "$(dirname "$0")/.zshrc" "$HOME/.zshrc"

# Backup existing .zshrc if it exists
if [ -f "$HOME/.p10k.zsh" ]; then
  print_status "Backing up existing .zshrc..."
  mv "$HOME/.p10k.zsh" "$HOME/.p10k.zsh.backup"
fi

# Copy new .p10k.zsh
print_status "Installing new .p10k.zsh..."
cp "$(dirname "$0")/.p10k.zsh" "$HOME/.p10k.zsh"

# exec zsh

# Install plugins in specified order
print_status "Installing plugins..."
PLUGIN_DIR="$(dirname "$0")/plugins"

for plugin in "${plugins[@]}"; do
  plugin_script="$PLUGIN_DIR/$plugin"

  if [ -f "$plugin_script" ]; then
    print_status "Installing $plugin..."

    # Make the plugin script executable
    chmod +x "$plugin_script"

    # Execute the plugin installation script
    if bash "$plugin_script"; then
      print_status "$plugin installed successfully"
    else
      print_error "Failed to install $plugin"
    fi
  else
    print_error "Plugin script for $plugin not found at $plugin_script"
  fi
done

print_status "Switch to zsh"

print_status "Installation complete! Please restart your terminal for changes to take effect."

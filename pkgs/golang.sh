#!/bin/bash

echo "installing golang"
# Install Go
GO_VERSION="1.23.4" # You can change this to your desired version
wget https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
rm go$GO_VERSION.linux-amd64.tar.gz

# Setup Go environment
mkdir -p $HOME/go/{bin,pkg,src}

# Install common Go tools
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Install useful Go tools
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/fatih/gomodifytags@latest
go install github.com/cweill/gotests/gotests@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install honnef.co/go/tools/cmd/staticcheck@latest

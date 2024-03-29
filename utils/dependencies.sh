#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/erdinin/testnet-guides/main/utils/common.sh)

printCyan "1. Güncellemeler yapılıyor..." && sleep 1
sudo apt update

printCyan "2. Gereklilikler kuruluyor..." && sleep 1
sudo apt install -y make gcc jq curl git lz4 build-essential chrony unzip

printCyan "3. Go yükleniyor..." && sleep 1
if ! [ -x "$(command -v go)" ]; then
  source <(curl -s "https://raw.githubusercontent.com/erdinin/testnet-guides/main/utils/go-install.sh")
  source .bash_profile
fi

echo "$(go version)"

#!/bin/bash
sudo apt-get update
sudo apt-get install -y npm tmux ripgrep tig

git clone https://codeberg.org/caynevejvoda/nvim-config ~/.config/nvim
git clone https://codeberg.org/caynevejvoda/tmux-config ~/.config/tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz -O /tmp/nvim.tar.gz
sudo mkdir /usr/local/bin/nvim
sudo tar -xvf /tmp/nvim.tar.gz -C /usr/local/bin/nvim/ --strip-components 1

echo "export PATH=\"$PATH:/usr/local/bin/nvim/bin/:/usr/local/py-utils/bin/\"" >> ~/.bashrc
echo "alias vim=\"nvim\"" >> ~/.bashrc
echo "alias tmux=\"tmux -u\"" >> ~/.bashrc

git config --global gpg.format ssh
git config --global user.signingkey "key::ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINOJk2GCqHvTwe/4W+mwXRist758E1NUIEHIBQVp46Fc c.vejvoda@demv.de"
git config --global commit.gpgsign true

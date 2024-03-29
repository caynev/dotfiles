#!/bin/bash
sudo apt-get update
sudo apt-get install -y npm ripgrep fzf tig stow

git clone https://git.sr.ht/~cayne/dotfiles ~/dotfiles

stow -d ~/dotfiles/ nvim

wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz -O /tmp/nvim.tar.gz
sudo mkdir /usr/local/bin/nvim
sudo tar -xvf /tmp/nvim.tar.gz -C /usr/local/bin/nvim/ --strip-components 1

tee -a ~/.bashrc << END
export PATH="$PATH:/usr/local/bin/nvim/bin/"
alias ll="ls -l"
alias la="ls -la"
END

git config --global gpg.format ssh
git config --global user.signingkey "key::ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINOJk2GCqHvTwe/4W+mwXRist758E1NUIEHIBQVp46Fc c.vejvoda@demv.de"
git config --global commit.gpgsign true

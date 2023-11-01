#!/bin/bash
sudo apt-get update
sudo apt-get install -y npm ripgrep tig zsh exa fzf tmux

rm -rf ~/.oh-my-zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

git clone https://codeberg.org/caynevejvoda/zsh-config ~/.config/zsh
git clone https://codeberg.org/caynevejvoda/nvim-config ~/.config/nvim
git clone https://codeberg.org/caynevejvoda/tmux-config ~/.config/tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz -O /tmp/nvim.tar.gz
sudo mkdir /usr/local/bin/nvim
sudo tar -xvf /tmp/nvim.tar.gz -C /usr/local/bin/nvim/ --strip-components 1

rm -f ~/.zshrc
cp ~/dotfiles/zshrc ~/.zshrc

sudo chsh -s /bin/zsh vscode

git config --global gpg.format ssh
git config --global user.signingkey "key::ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINOJk2GCqHvTwe/4W+mwXRist758E1NUIEHIBQVp46Fc c.vejvoda@demv.de"
git config --global commit.gpgsign true

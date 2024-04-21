!/bin/bash

cd ~
git clone https://github.com/TimoLob/dotfiles.git --recurse-submodules

yay -S kitty zsh stow ttf-meslo-nerd-font-powerlevel10k zsh-theme-powerlevel10k-git ripgrep zoxide neovim-git --noconfirm

cd dotfiles
stow .
cd scripts
source set_bg.sh
chsh -s $(which zsh)

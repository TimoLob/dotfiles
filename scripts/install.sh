!/bin/bash

cd ~
git clone https://github.com/TimoLob/dotfiles.git --recurse-submodules

yay -S kitty zsh stow ttf-meslo-nerd-font-powerlevel10k zsh-theme-powerlevel10k-git ripgrep zoxide neovim-git --noconfirm


mv ~/.config/kitty ~/.config/kitty_bak
mv ~/.config/i3 ~/.config/i3_bak
mv ~/.config/nvim ~/.config/nvim_bak
mv ~/.zshrc ~/.zshrc_bak
mv ~/.backgrounds ~/.backgrounds_bak

cd dotfiles
stow .
cd scripts
source ./set_bg.sh
chsh -s $(which zsh)

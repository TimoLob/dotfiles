!/bin/bash

cd ~
git clone https://github.com/TimoLob/dotfiles.git 

yay -S kitty zsh stow ttf-meslo-nerd-font-powerlevel10k zsh-theme-powerlevel10k-git ripgrep fd zoxide neovim-git --noconfirm


if [ -d "$HOME/.config/kitty" ]; then
	mv ~/.config/kitty ~/.config/kitty_bak
fi

if [ -d "$HOME/.config/i3" ]; then
	mv ~/.config/i3 ~/.config/i3_bak
fi

if [ -d "$HOME/.config/nvim" ]; then
	mv ~/.config/nvim ~/.config/nvim_bak
fi

if [ -d "$HOME/.backgrounds" ]; then
	mv ~/.backgrounds ~/.backgrounds_bak
fi

if [ -f "$HOME/.zhsrc" ]; then
	mv ~/.zshrc ~/.zshrc_bak
fi

cd dotfiles
git clone https://github.com/TimoLob/my_neovim_config.git .config/nvim

stow .
cd scripts
source ./set_bg.sh
chsh -s $(which zsh)

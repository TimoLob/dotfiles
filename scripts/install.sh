#!/bin/bash

# Display Stuff
#
echo "Installing display manager stuff"
yay -S lightdm web-greeter web-greeter-theme-shikai xorg i3 picom polybar feh rofi-rofi-power-menu xclip pulseaudio i3lock

# Fonts
echo "Install fonts"
yay -S ttf-meslo-nerd ttf-cascadia-code-nerd jetbrains-mono-nerd noto-fonts-emoji papiru-icon-theme

# Install Shell Stuff
echo "Installing shell stuff"
yay -S kitty alacritty neovim stow zsh starship fzf man-db tldr bat eza jq tmux

echo "Changing shell to zsh"
chsh -s $(which zsh)


# Essential Programs
echo "Installing essential programs"
yay -S thunar firefox tmux maim

# Additional programs
echo "Installing additional programs"
yay -S onedrive-abraunegg obsidian discord

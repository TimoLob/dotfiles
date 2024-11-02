#!/bin/bash

# Helper function to ask for user confirmation
confirm() {
    read -r -p "$1 [Y/n]: " response
    case "$response" in
        [yY][eE][sS]|[yY]|"") true ;;
        *) false ;;
    esac
}

# Display Stuff
echo -e "\n==> Installing display manager and related packages"
if confirm "Do you want to install the display manager and window manager packages?"; then
    echo "Installing lightdm, web-greeter, xorg, and i3-related packages..."
    yay -S lightdm web-greeter web-greeter-theme-shikai xorg i3 picom polybar feh rofi-rofi-power-menu xclip pulseaudio i3lock
    echo "Display manager and window manager packages installed."
else
    echo "Skipping display manager installation."
fi

# Fonts
echo -e "\n==> Installing fonts and icon themes"
if confirm "Do you want to install fonts and icon themes?"; then
    echo "Installing Nerd Fonts and icon themes..."
    yay -S ttf-meslo-nerd ttf-cascadia-code-nerd jetbrains-mono-nerd noto-fonts-emoji papirus-icon-theme
    echo "Fonts and icon themes installed."
else
    echo "Skipping fonts and icon themes installation."
fi

# Shell Utilities
echo -e "\n==> Installing shell utilities"
if confirm "Do you want to install shell utilities?"; then
    echo "Installing Kitty, Alacritty, Neovim, and other shell utilities..."
    yay -S kitty alacritty neovim stow zsh starship fzf man-db tldr bat eza jq tmux
    echo "Shell utilities installed."

    # Change shell to zsh
    if confirm "Do you want to set zsh as the default shell?"; then
        chsh -s "$(which zsh)"
        echo "Default shell changed to zsh."
    else
        echo "Skipped changing shell to zsh."
    fi
else
    echo "Skipping shell utilities installation."
fi

# Essential Programs
echo -e "\n==> Installing essential programs"
if confirm "Do you want to install essential programs?"; then
    echo "Installing Thunar, Firefox, and other essential programs..."
    yay -S thunar firefox tmux maim
    echo "Essential programs installed."
else
    echo "Skipping essential programs installation."
fi

# Additional Programs
echo -e "\n==> Installing additional programs"
if confirm "Do you want to install additional programs (e.g., OneDrive, Obsidian, Discord)?"; then
    echo "Installing additional programs..."
    yay -S onedrive-abraunegg obsidian discord
    echo "Additional programs installed."
else
    echo "Skipping additional programs installation."
fi

echo -e "\n==> Installation script completed!"

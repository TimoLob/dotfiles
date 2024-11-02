#!/bin/bash

# Helper function to ask for user confirmation
confirm() {
    read -r -p "$1 [Y/n]: " response
    case "$response" in
        [yY][eE][sS]|[yY]|"") true ;;
        *) false ;;
    esac
}


echo -e "\n==> Updating system and synchronizing package databases"
if confirm "Do you want to update the system before proceeding?"; then
  yay -Syu
  echo "System updated"
else
  echo "Skipping system update"
fi


# Display Stuff
echo -e "\n==> Installing display manager and related packages"
if confirm "Do you want to install the display manager and window manager packages?"; then
    echo "Installing lightdm, web-greeter, xorg, and i3-related packages..."
    yay -S lightdm web-greeter web-greeter-theme-shikai xorg i3 picom polybar feh rofi-rofi-power-menu xclip pulseaudio i3lock arandr
    echo "Display manager and window manager packages installed."
    echo "Don't forget to set your greeter-session in /etc/lightdm/lightdm.conf to web-greeter"
    echo "and your web greeter theme and wallpaper folder in /etc/lightdm/web-greeter.yml."
    if confirm "Enable lightdm service now?"; then
      sudo systemctl enable lightdm.service
      echo "Lightdm enabled"
    else
      echo "Lightdm not enabled, enable it with systemctl enable lightdm.service"
    fi
else
    echo "Skipping display manager installation."
fi


# Network
echo -e "==> Installing network manager and printing support"
if confirm "Do you want to install NM and printer drivers?"; then
  echo "Installing NM and cups"
  yay -S networkmanager network-manager-applet cups cups-pdf system-config-printer
  echo "Network manager (+applet), and printing support installed"
  # Enable NetworkManager and CUPS services
  if confirm "Do you want to enable NetworkManager and CUPS services on startup?"; then
    sudo systemctl enable NetworkManager
    sudo systemctl enable cups
    echo "NetworkManager and CUPS services enabled"
  else
    echo "Skipping service enablement."
  fi
else 
  echo "Skipping NM and printer setup."
fi

# Fonts
echo -e "\n==> Installing fonts and icon themes"
if confirm "Do you want to install fonts and icon themes?"; then
    echo "Installing Nerd Fonts and icon themes..."
    yay -S ttf-meslo-nerd ttf-cascadia-code-nerd ttf-jetbrains-mono-nerd noto-fonts-emoji papirus-icon-theme
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
    yay -S onedrive-abraunegg obsidian discord timeshift vscode zotero vivaldi
    echo "Additional programs installed."
else
    echo "Skipping additional programs installation."
fi

echo -e "\n ==>Installing Multimedia"
if confirm "Do you want to install multimedia programs (VLC,krita, libre office)?"; then
  echo "Installing multimedia programs"
  yay -S krita vlc libreoffice-fresh libreoffice-fresh-de libreoffice-fresh-en-gb amberol
  echo "Installed Multimedia applications"
else
  echo "Skipping multimedia"
fi

echo -e "\n==> Installing power management tools (useful for laptops)"
if confirm "Do you want to install power management tools (tlp, powertop)?"; then
  yay -S tlp powertop
  sudo systemctl enable tlp
  echo "Power management tools installed and TLP service enabled."
else
  echo "Skipping power management"
fi

echo -e "\n==> Setting up custom configurations."
if confirm "Do you want to stow your dotfiles now? (Please make sure you cloned the dotfiles to your home directory ~/dotfiles)"; then
  cd ~/dotfiles/ 
  stow .
  echo "Stowed dotfiles"
else
  echo "Skipping dotfiles setup"
fi


echo -e "\n==> Installation script completed!\n"
echo "After installation steps:"
echo "https://wiki.archlinux.org/title/LightDM - How to setup web-greeter <- Important"
echo "https://github.com/TheWisker/Shikai - How to setupt greeter theme"



echo -e "\n"
if confirm "Do you have multiple monitors on this machine?"; then
  echo "Run arandr and save your monitor configuration to ~/.screenlayout/monitor.sh"
  mkdir -p ~/.screenlayout
fi

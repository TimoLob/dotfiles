# My Personal Linux Config

Install dependencies:

```bash
yay -S kitty zsh stow 
yay -S ttf-meslo-nerd-font-powerlevel10k
yay -S zsh-theme-powerlevel10k-git
chsh -s $(which zsh)
git clone https://github.com/TimoLob/dotfiles
cd dotfiles
stow .
```

Run `arandr` to setup monitor configuration and save as `~/.screenlayout/monitor.sh`.

## WIP - One liner installation
Recommended to run in EndevourOs with i3 installed.
```bash
curl "https://raw.githubusercontent.com/TimoLob/dotfiles/main/scripts/install.sh" | sh
```

## Ubuntu
```
sudo apt install rofi i3blocks thunar
```

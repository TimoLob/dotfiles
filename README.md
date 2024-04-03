# My Personal Linux Config

Install dependencies:

```bash
yay -S kitty zsh stow 
yay -S ttf-meslo-nerd-font-powerlevel10k
yay -S zsh-theme-powerlevel10k-git
chsh -s $(which zsh)
git clone https://github.com/TimoLob/dotfiles
localectl set-x11-keymap us default intl # Set keyboard layout to Us-international
cd dotfiles
stow .
```

Run `arandr` to setup monitor configuration and save as `~/.screenlayout/monitor.sh`.

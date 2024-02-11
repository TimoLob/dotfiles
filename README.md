# My Personal Linux Config

Install dependencies:

```bash
yay -S kitty
yay -S zsh
yay -S ttf-meslo-nerd-font-powerlevel10k
yay -S zsh-theme-powerlevel10k-git
yay -S stow
#echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
chsh -s $(which zsh)
git clone this repo
cd dotfiles
stow .
```

Run `arandr` to setup monitor config and save as monior.sh.


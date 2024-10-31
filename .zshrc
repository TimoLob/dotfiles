eval "$(starship init zsh)"


# Aliases
alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'
alias cd..='cd ..'
alias ods='onedrive --sync'
alias vim='nvim'
alias cls='clear'
alias :qa="exit"
alias eukeyboard="setxkbmap eu"
alias rubvpn="sudo openvpn /etc/openvpn/RUBvpn_Standard.ovpn"
alias lab="jupyter lab"

bindkey "^[[3~" delete-char

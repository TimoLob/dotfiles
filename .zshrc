# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/timo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Plugin manager
## Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

## Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

## Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

## Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found


# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Ignore case when fuzzy matching
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# NPM Packages
NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"


# Aliases
alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'
alias cd..='cd ..'
#alias ods='onedrive --sync'
alias vim='nvim'
alias cls='clear'
alias anylogic='/opt/anylogic/anylogic'
alias edo='~/Apps/ProjectIgnis/EDOPro'
alias :qa="exit"
alias eukeyboard="setxkbmap eu"
alias rubvpn="sudo openvpn --config /etc/openvpn/RUBvpn_Standard.ovpn --auth-user-pass ~/.ssh/openvpnpass.txt"
alias condainit='eval "$(/home/timo/anaconda3/bin/conda shell.zsh hook)" && conda init'
alias lab="jupyter lab"
# Syncthing wait until all devices and all folders are synchronized for at least a second
alias syncwait="syncthingctl wait-for-idle --all-devs --all-dirs --at-least 1000" 


#alias thesis='condainit && conda activate ml && cd ~/master-thesis/ && code . && tmux'
alias thesis='tmux kill-session -t thesis 2>/dev/null; condainit && conda activate ml && cd ~/master-thesis && code . && tmux new-session -d -s thesis -c ~/master-thesis \; new-window -n jupyter -c ~/master-thesis "jupyter lab" \; select-window -t thesis:1 \; attach-session -t thesis'


bindkey "^[[3~" delete-char
bindkey '^f' autosuggest-accept # Ctrl+F to accept autocompletion
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

## Conditional aliases, only use if program is available
## Replace cat with bat, same thing but with syntax highlighting
if command -v bat 2>&1 >/dev/null
then
  alias cat=bat
fi
## Replace ls with eza, looks prettier
if command -v eza 2>&1 >/dev/null
then
  alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
  alias ll="eza --color=always --all --long"
  alias lstree="ls --tree --level"
fi


eval "$(zoxide init zsh --cmd cd)"
eval "$(dircolors ~/.dircolors)"
eval "$(fzf --zsh)"


alias "helpkitty"="cat ~/.config/kitty/kitty.conf"

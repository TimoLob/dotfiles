eval "$(starship init zsh)"


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


# Aliases
alias ls='ls --color=auto'
alias ll='ls -lav ignore=..'
alias lsa="ls -a"
alias cd..='cd ..'
alias ods='onedrive --sync'
alias vim='nvim'
alias cls='clear'
alias :qa="exit"
alias eukeyboard="setxkbmap eu"
alias rubvpn="sudo openvpn /etc/openvpn/RUBvpn_Standard.ovpn"
alias lab="jupyter lab"
if command -v bat 2>&1 >/dev/null
then
  alias cat=bat
fi
if command -v eza 2>&1 >/dev/null
then
  alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
  alias ll="eza --color=always --all --long"
  alias lstree="ls --tree --level"
fi

# Keybindings
bindkey "^[[3~" delete-char # Make del work
bindkey '^f' autosuggest-accept # Ctrl+F to accept autocompletion
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


# History
HISTSIZE=5000 # last Save 5000 commands
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase # Erase duplicates
setopt appendhistory # append to history file instead of overwriting it 
setopt sharehistory # Share history among simultaneous zsh sessions
setopt hist_ignore_space # Preprend a space before a command to prevent if from being saved (useful for commands containing sensitive information)
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# Shell Integration
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

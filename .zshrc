#Set the directory we want to store zinit and plugin
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -d $ZINIT_HOME ]]; then
  mkdir -p $ZINIT_HOME
  git clone https://github.com/zdharma-continuum/zinit.git $ZINIT_HOME
fi

# theme
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/ohmyposh.toml)"

#Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# add zsh plugin
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# add snipit 
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found


autoload -U compinit && compinit

zinit cdreplay -q

# keybinding
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups

# compeletion styling
zstyle ':completion:*' menu no
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':fzf-tab:completion:cd:*' fzf-preview 'ls --color=always $realpath'
zstyle ':fzf-tab:completion:__zoxide_z:*' fzf-preview 'ls --color=always $realpath'

# alias
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias vim='nvim'
alias vi='nvim'
alias c='clear'

# fzf
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

export CC="clang"
export CXX="clang++"

export TERM=xterm-256color

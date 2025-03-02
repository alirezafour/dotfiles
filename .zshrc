export TERM=xterm-256color

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
alias gs='git status'
alias ga='git add'
alias gP='git push'
alias gp='git pull'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'
alias g='lazygit'

# fzf
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

export CC="clang"
export CXX="clang++"

# PATH for my db
export PATH=$HOME/code/cpp/cppLLM/Vynna/postgres/db:$PATH

#ROCm PATH
PATH_ROCM="/opt/rocm:/opt/rocm/lib:/opt/rocm/share:/opt/rocm/bin" # only enable if you have rocm installed

# export enviroment variable for ROCm and pytorch
export PATH="${PATH_ROCM}:$PATH"
export LD_LIBRARY_PATH="/opt/rocm/lib:$LD_LIBRARY_PATH"
export LIBRARY_PATH="/opt/rocm/lib:$LIBRARY_PATH"
export C_INCLUDE_PATH="/opt/rocm/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="/opt/rocm/include:$CPLUS_INCLUDE_PATH"

#ROCm devices visibility
export HIP_VISIBLE_DEVICES=0
export ROCR_VISIBLE_DEVICES=0
export TRITON_USE_ROCM=1

#ROCm acrchitectures and overrides
export AMDGPU_TARGET=gfx1100
export HCC_AMDGPU_TARGET=gfx1100
export PYTORCH_ROCM_ARCH=gfx1100
export HSA_OVERRIDE_GFX_VERSION=11.0.0
export ROCM_PATH="/opt/rocm"
export ROCM_HOME="/opt/rocm"
export HIP_PLATFORM=amd

# PyTorch ROCm Memory Management
export PYTORCH_HIP_ALLOC_CONF="expandable_segments:False,garbage_collection_threshold:0.8"

# Optional: Disable hipBLASLt if issues occur
export USE_HIPBLASLT=0
export TORCH_BLAS_PREFER_HIPBLASLT=0

# Optional: Logging for debugging
# export ROCM_LOG_LEVEL=4  # Uncomment for verbose debugging


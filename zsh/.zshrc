# Run fastfetch if terminal is large enough
if [ "$(tput cols)" -ge 120 ]; then
	fastfetch
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Plugins
# 
# 1: Better autosuggestions
# 2: Highlight commands while typing
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Export variables
export EDITOR=nvim
export VISUAL="$EDITOR"
export TERM=xterm-256color
export COLORTERM=xterm-256color
export BAT_THEME=ansi

# History
#
# 1: Set history file
# 2: How many lines to record in history file
# 3: How many commands to keep in temp history
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=1000

# Options
#
# 1: Share history across active zsh sessions
# 2: Duplicate commands are removed first
# 3: Don't record duplicate commands to history file
# 4: Don't immediately execute command on up-arrow
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# General aliases
alias ol="ls -lhA --color=auto"
alias vim="nvim"
alias ff="fastfetch"

# List aliases
alias l="eza --tree --all --level=1 --color=always \
--long --git --no-user --no-permissions"

alias ll="eza --tree --all --level=2 --color=always \
--long --git --no-user --no-permissions"

alias lll="eza --tree --all --level=3 --color=always \
--long --git --no-user --no-permissions"

# Misc
# 
# 1: Enable vi mode
# 2: Enable thefuck (command auto-correction)
bindkey -v
eval $(thefuck --alias)

# Fuzzy finding config
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Better ** completion when looking for files
_fzf_compgen_path() {
	fd --hidden --exclude .git . "$1"
}

# Better ** when looking for dirs
_fzf_compgen_dir() {
	fd --type=d --hidden --exclude .git . "$1"
}

# Enable case-insensitive file searching
autoload -Uz +X compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Preview files with eza while using fzf
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
	  cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
	  export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
	  ssh)          fzf --preview 'dig {}'                   "$@" ;;
	  *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

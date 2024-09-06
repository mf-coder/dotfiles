# === Being greeting ===
greet_based_on_time() {
    cur_hour=$(date +"%H")

    if [ "$cur_hour" -ge 6 ] && [ "$cur_hour" -lt 12 ]; then
        message="Morning!"
    elif [ "$cur_hour" -ge 12 ] && [ "$cur_hour" -lt 18 ]; then
        message="Afternoon!"
    else
        message="Evening!"
    fi

    figlet -f ~/.local/share/fonts/3d.flf -w 150 $message | lolcat
}

greet_based_on_time
# === End greeting === 

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Plugins
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# List aliases
alias ol="ls -lhA --color=auto"

alias l="eza --tree --all --level=1 --color=always \
--long --git --icons=always --no-time --no-user --no-permissions"

alias ll="eza --tree --all --level=2 --color=always \
--long --git --icons=always --no-time --no-user --no-permissions"

alias lll="eza --tree --all --level=3 --color=always \
--long --git --icons=always --no-time --no-user --no-permissions"

# General aliases
alias greet="greet_based_on_time"
alias vim="nvim"
alias py="python3"
alias zc="vim ~/.zshrc"
alias vcc="cd ~/.config/nvim/lua/mf/core/"
alias vcp="cd ~/.config/nvim/lua/mf/plugins/"
alias dotfiles="cd ~/repos/dotfiles/"
alias ff="fastfetch"
alias c="clear"

# History
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999

setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Enable case-insensitive file search
autoload -Uz +X compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# Enable vi mode when inputting commands
bindkey -v

# Export variables
export EDITOR=nvim
export VISUAL="$EDITOR"
export COLORTERM=truecolor

# Enable fzf
eval "$(fzf --zsh)"

# Have fzf use fd rather than find
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Better ** completion when looking for files
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Better ** completion when looking for dirs
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

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

# Set fzf theme (mocha)
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Set bat custom theme (mocha)
export BAT_THEME="Catppuccin Mocha"

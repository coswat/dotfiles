# History
HISTSIZE=2000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_ignore_space

# Ctrl-R history search with skim
function sk-history-widget() {
  local selected
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=$(
    fc -rl -n 1 | sk \
      --height 40% \
      --reverse \
      --prompt="History> " \
  ) || return

  LBUFFER+="$selected"
  zle reset-prompt
  tput cnorm
}

zle -N sk-history-widget

# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^r' sk-history-widget

# Aliases
alias ls="eza -l"
alias c="clear"
alias bat="bat --theme 'Catppuccin Mocha'"

# Paths
export PATH="$HOME/.cargo/bin:$PATH"

# Zsh plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Plugin tunings
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=#8A4A4A"
#ZSH_HIGHLIGHT_STYLES[path]="fg=purple"
ZSH_HIGHLIGHT_STYLES[arg0]="fg=white"

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

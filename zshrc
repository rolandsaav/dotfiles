# Colors
autoload -U colors && colors

# Auto CD
setopt AUTO_CD

# History
HISTSIZE=10000
SAVEHIST=10000

# Completion setup
autoload -Uz compinit
zmodload zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-dirs-first true
compinit -C                      # Use caching to speed up

# Show hidden files in glob
_comp_options+=(globdots)

# LS_COLORS
eval "$(gdircolors -b)"

# PATH
export PATH=/opt/homebrew/bin:$PATH

# Homebrew shell env
eval "$(/opt/homebrew/bin/brew shellenv)"

# Prompt (you use Starship so PS1 is unused, optional to keep)
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}saav@%{$fg[blue]%}%{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Vi Mode
bindkey -v
export KEYTIMEOUT=1

# Completion navigation
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Cursor shape for vi modes
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]] || [[ $1 == 'block' ]]; then
    echo -ne '\e[1 q'
  else
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() { zle -K viins; echo -ne '\e[5 q' }
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' }

# Ctrl-e: Edit command in nvim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load shortcuts/aliases
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Lazy-load NVM (remove any other NVM lines!)
export NVM_LAZY_LOAD=true
source ~/tools/zsh-nvm/zsh-nvm.plugin.zsh

# Pyenv (optional: consider lazy-loading this too)
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Git config
git config --global core.editor "nvim -c 'set ft=gitcommit'"

# Env vars
export EDITOR=nvim
export FIREFOX_PATH='~/Library/Application Support/Firefox/Profiles/comz8kvj.dev-edition-default'

# Direnv
eval "$(direnv hook zsh)"

# Starship prompt
eval "$(starship init zsh)"

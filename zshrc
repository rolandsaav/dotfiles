# Colors (don't know what this does for me)
autoload -U colors
colors

# Auto CD wihout typing CD
setopt AUTO_CD

# History
HISTSIZE=10000
SAVEHIST=10000

# Basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Set up LS_COLORS using dircolors
eval "$(gdircolors -b)"

# Colors in completions
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}  # Use dircolors/LS_COLORS

# Dirs first in completion
zstyle ':completion:*' list-dirs-first true

# Path
export PATH=/opt/homebrew/bin:$PATH

# Homebrew stuff
eval "$(/opt/homebrew/bin/brew shellenv)"

# PROMPT
# This information is in "man zshmisc" -> Expansion of Prompt Sequences

# PS1='%B%F{blue}%4~%f%E%F{green} %F{red}saav%f$%f%b '

# LUKE SMITH Prompt edited
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}saav%{$fg[green]%}@%{$fg[blue]%} %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "


# VI Mode
bindkey -v
export KEYTIMEOUT=1

# Completion navigation with Vim commands
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Pyenv 
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


# GIT Stuff
git config --global core.editor "nvim -c 'set ft=gitcommit'"

# ENV VARS
EDITOR=nvim

fpath+=~/.zfunc; autoload -Uz compinit; compinit

export FIREFOX_PATH='~/Library/Application Support/Firefox/Profiles/comz8kvj.dev-edition-default'

eval "$(starship init zsh)"

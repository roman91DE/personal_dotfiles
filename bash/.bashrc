# ~/.bashrc: executed by bash for interactive shells.
 

# Only run the rest if this is an interactive shell
[[ $- != *i* ]] && return


# Add Homebrew to PATH on MacOS
if [[ -d /opt/homebrew/bin ]]; then
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
elif [[ -d /usr/local/bin ]]; then
  export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
fi

if [[ -d "$HOME/.local/bin" ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [[ -d "$HOME/bin" ]]; then
  export PATH="$HOME/bin:$PATH"
fi

# Don't put duplicate lines in the history
HISTCONTROL=ignoredups:erasedups

# Append to the history file, don't overwrite it
shopt -s histappend

# Set history file and size
HISTFILE=~/.bash_history
HISTSIZE=1000
HISTFILESIZE=2000


# Prompt Design

# Custom colors
USER_COLOR="\e[36m"      # Cyan for your name
DIR_COLOR="\e[34m"       # Blue for the directory
BRANCH_COLOR="\e[33m"    # Yellow for Git branches
SYMBOL_COLOR="\e[35m"    # Magenta for the symbol
RESET_COLOR="\e[0m"      # Reset to default

# Git branch function
git_branch() {
  # Get current branch name if in a Git repository
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  [[ -n $branch ]] && echo "${BRANCH_COLOR}⎇ $branch${RESET_COLOR}"
}

# Custom prompt
PS1="${USER_COLOR}\u@\h ${RESET_COLOR} \[${DIR_COLOR}\]\w\[${RESET_COLOR}\] \$(git_branch) ${SYMBOL_COLOR}⚡${RESET_COLOR} "


# Enable color support of ls and handy aliases
if command -v dircolors &> /dev/null; then
    eval "$(dircolors -b ~/.dircolors 2>/dev/null || dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Some more ls aliases
alias ll='ls -l'
alias la='ls -al'

alias rm='echo "rm is disabled, use remove or trash or /bin/rm instead."'

# Use bash-completion if available
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
elif [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi


# Set vi keybindings (skip inside neovim terminal)
if [[ -z "$NVIM" ]]; then
  set -o vi
fi

# Environment Variables

## User-specific IPython Directory

if [ -d "$HOME/.ipython" ]; then
  export IPYTHONDIR=~/.ipython
fi

# Set the default editor to nvim if available, otherwise vim
if command -v nvim &> /dev/null; then
  export EDITOR='nvim'
  export VISUAL='nvim'
else
  export EDITOR='vim'
  export VISUAL='vim'
fi

# claude code
qp() {
  if [ $# -gt 0 ]; then
    claude -p "$*"
  else
    claude -p "$(cat)"
  fi
}

# python aliases
alias pycheck='uv tool run ruff check . && uv tool run ruff format . && uv tool run ty check .'

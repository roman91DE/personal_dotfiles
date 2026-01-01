# ~/.zshrc: executed by zsh for interactive shells.
 

# Only run the rest if this is an interactive shell
[[ $- != *i* ]] && return


# Add Homebrew to PATH on MacOS
if [[ -d /opt/homebrew/bin ]]; then
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
elif [[ -d /usr/local/bin ]]; then
  export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
fi

# Don't put duplicate lines in the history
setopt HIST_IGNORE_ALL_DUPS

# Append to the history file, don't overwrite it
setopt APPEND_HISTORY

# Set history file and size
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000


# Prompt Design

# Enable color definitions
autoload -U colors && colors

# Custom colors
USER_COLOR="%F{cyan}"    # Cyan for your name
DIR_COLOR="%F{blue}"     # Blue for the directory
BRANCH_COLOR="%F{yellow}" # Yellow for Git branches
SYMBOL_COLOR="%F{magenta}" # Magenta for the symbol
RESET_COLOR="%f"         # Reset to default

# Git branch function
git_branch() {
  # Get current branch name if in a Git repository
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    [[ -n $branch ]] && echo "${BRANCH_COLOR}⎇ $branch${RESET_COLOR}"
}

# Custom prompt
PROMPT="${USER_COLOR}Roman ${RESET_COLOR} %B${DIR_COLOR}%~%b $(git_branch) ${SYMBOL_COLOR}⚡${RESET_COLOR} "


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

# use autocomplete if available
if [[ -n "$HOMEBREW_PREFIX" && -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi


# Set vi keybindings
bindkey -v

# Environment Variables

## User-specific IPython Directory

if [ -d "$HOME/.ipython" ]; then
  export IPYTHONDIR=~/.ipython
fi

# Set the default editor to nano
export EDITOR='vim'
export VISUAL='vim'

# python aliases
alias pycheck='uv tool run ruff check . && uv tool run ruff format . && uv tool run ty check .'







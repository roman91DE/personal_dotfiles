# ~/.zshrc: executed by zsh for interactive shells.
 

# Only run the rest if this is an interactive shell
[[ $- != *i* ]] && return


# Add Homebrew to PATH on MacOS
if [[ -d /opt/homebrew/bin ]]; then
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
  export HOMEBREW_PREFIX="/opt/homebrew"
elif [[ -d /usr/local/bin ]]; then
  export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
fi

if [[ -d "$HOME/.local/bin" ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if command -v tmux >/dev/null 2>&1; then
    if tmux list-sessions >/dev/null 2>&1; then
        echo "Available tmux sessions:"
        tmux list-sessions
    fi
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


# Aliases
source ~/.zsh_aliases

if [[ -n "$HOMEBREW_PREFIX" && -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    # use autosuggestions if available
    echo "loading zsh-autosuggestions"
    source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
elif [[ -n "$HOMEBREW_PREFIX" && -f "$HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh" ]]; then
    # alternative: use autocomplete if available
    echo "loading zsh-autocomplete"
    source "$HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
fi

# Set vi keybindings 
bindkey -v


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







export LC_ALL=en_US.UTF-8

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# ~/.zshrc: executed by zsh for interactive shells.
 

# Only run the rest if this is an interactive shell
[[ $- != *i* ]] && return


# Add Homebrew to PATH on MacOS
if [[ -d /opt/homebrew/bin ]]; then
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
elif [[ -d /usr/local/bin ]]; then
  export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
fi

# Don't put duplicate lines or lines starting with space in the history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

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
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# Colored GCC warnings and errors
# export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

if command -v nvim >/dev/null 2>&1; then
    alias vim='nvim'
fi
# use autocomplete if available
if [[ -n "$HOMEBREW_PREFIX" && -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi


# Set vi keybindings
bindkey -v

# Environment Variables

## User-specific IPython Directory
export IPYTHONDIR=~/.ipython

# control the openjdk java version on path
# options include 11, 17
JAVAVERSION="11"

export PATH="/opt/homebrew/opt/openjdk@$JAVAVERSION/bin:$PATH"
export JAVA_HOME="/opt/homebrew/opt/openjdk@$JAVAVERSION"



if [ -d "$HOME/.ghcup/bin" ]; then
  export PATH="$HOME/.ghcup/bin:$PATH"
fi

if [ -d "$HOME/venvs/ipythonVenv" ]; then
    source "$HOME/venvs/ipythonVenv/bin/activate"
fi



# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/roman/.opam/opam-init/init.zsh' ]] || source '/Users/roman/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

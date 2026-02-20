# ~/.config/fish/config.fish: sourced by fish for interactive shells.

if not status is-interactive
    return
end


# Add Homebrew to PATH on macOS
if test -d /opt/homebrew/bin
    fish_add_path /opt/homebrew/bin /opt/homebrew/sbin
    set -gx HOMEBREW_PREFIX /opt/homebrew
else if test -d /usr/local/bin
    fish_add_path /usr/local/bin /usr/local/sbin
end

if test -d $HOME/.local/bin
    fish_add_path $HOME/.local/bin
end

if test -d $HOME/bin
    fish_add_path $HOME/bin
end


# Show available tmux sessions on startup
if command -q tmux
    if tmux list-sessions >/dev/null 2>&1
        echo "Available tmux sessions:"
        tmux list-sessions
    end
end


# Vi keybindings (skip inside neovim terminal)
if test -z "$NVIM"
    fish_vi_key_bindings
end


# Environment Variables

if test -d $HOME/.ipython
    set -gx IPYTHONDIR $HOME/.ipython
end

if command -q nvim
    set -gx EDITOR nvim
    set -gx VISUAL nvim
else
    set -gx EDITOR vim
    set -gx VISUAL vim
end

set -gx LC_ALL en_US.UTF-8


# iTerm2 shell integration
if test -e $HOME/.iterm2_shell_integration.fish
    source $HOME/.iterm2_shell_integration.fish
end


# Aliases

# Color support for ls
if command -q dircolors
    if test -f ~/.dircolors
        set -gx LS_COLORS (dircolors -b ~/.dircolors | string join ' ' | string replace -r ".*LS_COLORS='([^']+)'.*" '$1')
    else
        set -gx LS_COLORS (dircolors -b | string join ' ' | string replace -r ".*LS_COLORS='([^']+)'.*" '$1')
    end
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
end

alias ll='ls -l'
alias la='ls -al'

alias rm='echo "rm is disabled, use remove or trash or /bin/rm instead."'

# Tmux
alias tma='tmux attach -t'
alias tml='tmux list-sessions'
alias tmc='tmux new-session -s'
alias tmk='tmux kill-session -t'

# Python
alias pycheck='uv tool run ruff check . && uv tool run ruff format . && uv tool run ty check .'

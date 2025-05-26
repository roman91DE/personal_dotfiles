if status is-interactive
    # Commands to run in interactive sessions can go here
end

# use vi-keybindings
set -g fish_key_bindings fish_vi_key_bindings

# Add the homebrew bin and sbin directories to the PATH
if test -d /opt/homebrew/bin
    set -gx PATH /opt/homebrew/bin $PATH
end

if test -d /opt/homebrew/sbin
    set -gx PATH /opt/homebrew/sbin $PATH
end
# activate miniconda if exists
set CONDA_FISH_INIT_FILE "$HOME/miniconda3/etc/fish/conf.d/conda.fish"

if test -e $CONDA_FISH_INIT_FILE
    source $CONDA_FISH_INIT_FILE
end

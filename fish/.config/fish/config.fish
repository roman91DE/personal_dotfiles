if status is-interactive
    # Commands to run in interactive sessions can go here
end

# use vi-keybindings
set -g fish_key_bindings fish_vi_key_bindings

# activate miniconda if exists
set CONDA_FISH_INIT_FILE "$HOME/miniconda3/etc/fish/conf.d/conda.fish"

if test -e $CONDA_FISH_INIT_FILE
    source $CONDA_FISH_INIT_FILE
end


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/Users/roman/.opam/opam-init/init.fish' && source '/Users/roman/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration

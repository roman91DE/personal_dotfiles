# Fix VS Code escape key issue
# if test "$TERM_PROGRAM" = "vscode"
#     set -gx VSCODE_SHELL_INTEGRATION 0
#     bind -e \e\[I
# end

# Only apply in interactive sessions
if status is-interactive
    # Use vi key bindings
    # set -g fish_key_bindings fish_vi_key_bindings

    # Additional interactive-only commands can go here
end

# Add the Homebrew bin and sbin directories to the PATH
if test -d /opt/homebrew/bin
    set -gx PATH /opt/homebrew/bin $PATH
end

if test -d /opt/homebrew/sbin
    set -gx PATH /opt/homebrew/sbin $PATH
end

# ~/.config/fish/config.fish

# Add standard system paths if running on Alpine Linux
# if test -f /etc/alpine-release
#         fish_add_path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
#         end


# Activate miniconda if it exists
#set CONDA_FISH_INIT_FILE "$HOME/miniconda3/etc/fish/conf.d/conda.fish"
#if test -e $CONDA_FISH_INIT_FILE
#    source $CONDA_FISH_INIT_FILE
#end


 

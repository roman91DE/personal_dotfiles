function lvim --description 'Launch LazyVim profile'
    set -lx NVIM_APPNAME lazyvim
    nvim $argv
end

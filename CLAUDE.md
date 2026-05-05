# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A personal dotfiles repository managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory is a stow package that symlinks its contents into `$HOME`.

## Stow Commands

```bash
# Install a config module (creates symlinks in ~)
stow <package>       # e.g. stow zsh, stow vim

# Remove a config module
stow -D <package>

# Adopt an existing file into the repo
stow --adopt <package>
```

## Architecture

Each directory mirrors the home directory structure for stow. For example:
- `zsh/.zshrc` -> `~/.zshrc`
- `nvim/.config/nvim/init.lua` -> `~/.config/nvim/init.lua`
- `vscode/settings.json` -> `~/settings.json` (manually placed, not standard stow)

### Editor Setup

- `nvim` — full LazyVim distribution, default Neovim config at `~/.config/nvim/`
- `vim` — basic Vim using `vim/.vimrc`

### Shell Config

Both `bash/.bashrc` and `zsh/.zshrc` share similar structure (prompt, aliases, history). Both prefer `nvim` as `$EDITOR`/`$VISUAL` with a fallback to `vim`. Vi keybindings are enabled unless running inside neovim's integrated terminal (`$NVIM` is set).

Key aliases defined in zsh:
- `autogit` — pull, add all, commit, push in one command
- `pycheck` — run ruff check + ruff format + ty check via uv

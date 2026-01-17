# 🛠️ Roman’s Dotfiles

A modular and portable dotfiles setup managed using [GNU Stow](https://www.gnu.org/software/stow/).  
Includes configs for Bash, Zsh, Fish, Git, Vim, Neovim, Tmux, GHCi, and more.

---

## ⚙️ Requirements

- [GNU Stow](https://www.gnu.org/software/stow/)
- Unix-like environment (macOS, Linux, WSL)
- Optional: Git for cloning the repo

Install Stow (if not installed):

```bash
# Debian/Ubuntu
sudo apt install stow

# macOS (Homebrew)
brew install stow
```


---

## 🚀 Installation

Clone the repository and stow the configs you want:

```bash
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Stow selected modules
stow bash zsh git vim nvim lazyvim tmux fish ghci
```

Neovim profiles:

- `nvim` uses `~/.config/nvim` (your regular config)
- `lvim` uses `~/.config/lazyvim` (LazyVim config via `NVIM_APPNAME=lazyvim`)

To undo (unstow) a config:

```bash
stow -D vim  # removes ~/.vimrc symlink
```

---

## 🧹 Tips

- If you get a conflict warning from stow, move or back up the conflicting file:

```bash
mv ~/.ghci ~/.ghci.backup
stow ghci
```

- To automatically adopt existing files into the repo (advanced):

```bash
stow --adopt git
```

---

## 📁 License

MIT License. Use freely and adapt to your needs.


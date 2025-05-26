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


⸻

🚀 Installation

Clone the repository and stow the configs you want:

git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Stow selected modules
stow bash zsh git vim nvim tmux fish ghci

To undo (unstow) a config:

stow -D vim  # removes ~/.vimrc symlink


⸻

🧹 Tips
	•	If you get a conflict warning from stow, move or back up the conflicting file:

mv ~/.ghci ~/.ghci.backup
stow ghci


	•	To automatically adopt existing files into the repo (advanced):

stow --adopt git



⸻

📁 License

MIT License. Use freely and adapt to your needs.


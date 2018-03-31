#!/bin/bash

PWD=$PWD

ln_flags="-shf"

dotfiles=()
packages=()
os="macos"
ln_flags="-shf"

packages=()

# TODO: OS Specific configuration
# TODO: Create a script to install package based on OS type
# -----------------------------------------------
if [[ $(uname) == "Linux" ]]; then
    echo "Creating symlinks on Linux"
    os="linux"
    ln_flags="-sT"
    dotfiles=()
else
    echo "Creating symlinks on macOS"
    dotfiles=()
    packages=(
        "fzf"			# Fuzzy finder
        "the_silver_searcher"	# Faster than Ack
    )
fi

for i in "${dotfiles[@]}"; do
   ln "$ln_flags" $PWD/$os/$i ~/.$i
done

for i in "${packages

# General dotfiles 
# -----------------------------------------------
# ZSH 
# TODO: Install ZSH & Oh My ZSH
echo "Creating symlinks for ZSH configuration"
ln "$ln_flags" "$PWD/zsh" "$HOME/.zsh"
ln "$ln_flags" "$PWD/zsh/zshrc" "$HOME/.zshrc"

# Git
# TODO: Install Git
echo "Creating symlinks for Git configuration"
ln "$ln_flags" "$PWD/git/gitconfig" "$HOME/.gitconfig"
ln "$ln_flags" "$PWD/git/gitignore" "$HOME/.gitignore"

# TODO: Vim
# TODO: Install Vim / NeoVim
# TODO: Vim configuration

# TODO: Tmux
# TODO: Install Tmux & Tmuxinator (?)
echo "Creating symlinks for Tmux configuration"
TMUX_DIR=$HOME/.tmux
mkdir -p "$TMUX_DIR"
ln "$ln_flags" "$PWD/tmux" "$TMUX_DIR/config"
ln "$ln_flags" "$PWD/tmux/tmux.conf" "$HOME/.tmux.conf"

# TODO: FZF
# brew install fzf
# $(brew --prefix)/opt/fzf/install
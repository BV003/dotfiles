## BV003's Dotfiles

Welcome to my personal dotfiles repository! This collection contains my Linux/macOS development environment configurations, designed to help me quickly set up and synchronize my work environment on new machines.

**Important Note:** Please carefully inspect and understand the function of any scripts before cloning and running them to avoid overwriting your existing configuration files.

### ✨ Features

- gacp "message": git add + commit + push
- gd: show all changes, including new files
- gdrop: discard all changes, including new files (asks first)
- hp: pick a project and open it as a herdr space
- setproxy / unsetproxy: turn the Clash proxy on / off

### 📦 Contents

- shell.sh: shell functions, works in both zsh and bash

### 🚀  Installation

```
git clone https://github.com/BV003/dotfiles ~/dotfiles
```

Add this line to `~/.zshrc` (macOS) or `~/.bashrc` (Linux):

```
source ~/dotfiles/shell.sh
```

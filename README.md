# My Dotfiles

A personal collection of my configuration files (dotfiles) for various systems and applications.

## 📂 Structure

This repository is organized by system or application:

-   `zsh-arch/`: ZSH configuration (`.zshrc`, `.zprofile`) for Arch Linux.
-   `zsh-popos/`: ZSH configuration (`.zshrc`) for Pop!_OS.
-   `reflector/`: Configuration for the `reflector` utility to manage and rank Arch Linux mirrors.

## 🚀 Usage

These files are intended to be symlinked into the home directory. For example, to use the Arch ZSH configuration:

```bash
ln -s /path/to/dotfiles/zsh-arch/.zshrc ~/.zshrc
ln -s /path/to/dotfiles/zsh-arch/.zprofile ~/.zprofile
```

**Note:** Always back up your existing configuration files before replacing them.

## 🔧 Customization

These configurations are tailored to my personal workflow. Feel free to fork this repository and customize them to your own needs.
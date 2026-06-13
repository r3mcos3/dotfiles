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

## ✅ CI

On every push and pull request to `master`, a GitHub Actions workflow runs automatically:

- **Shellcheck** — lints the `reflector` script for shell issues.
- **Zsh syntax check** — validates all `.zshrc` and `.zprofile` files with `zsh -n`.
- **Functional tests** — runs `.github/scripts/test-zsh-config.sh` against each config to verify things like the `$EDITOR` variable, the `apt` function, and the `lg` alias.

## 🔧 Customization

These configurations are tailored to my personal workflow. Feel free to fork this repository and customize them to your own needs.
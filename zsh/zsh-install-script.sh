#!/bin/bash

# check if prerequisites are installed

if command -v zsh &> /dev/null && command -v git &> /dev/null && command -v wget &> /dev/null; then
    echo -e "prerequisites are already installed"
else
    if sudo apt install -y zsh git wget || sudo pacman -S zsh git wget || sudo dnf install -y zsh git wget; then
        echo -e "Prerequisites are installed"
    else
        echo -e "Please install the following packages: zsh, git, wget"
    fi
fi

# Make a directory for zsh plugins if it doesn't exist and install zsh-plugins
if [ -d "~/.zsh" ]; then
    echo "directory \"~/.zsh\" exists"
else
    mkdir -p ~/.zsh && echo -e "directory ~/.zsh created" && mkdir -p ~/.zsh/fonts && echo -e "directory ~/.zsh/fonts created"
fi

# zsh-autosuggestions
if [ -d "~/.zsh/zsh-autosuggestion" ]; then
    cd ~/.zsh/zsh-autosuggestion && git pull
else
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi

# zsh-syntax-highlighting
if [ -d "~/.zsh/zsh-syntax-highlighting" ]; then
    cd ~/.zsh/zsh-syntax-highlighting && git pull
else
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
fi

# zsh-completions
if [ -d "~/.zsh/zsh-completions" ]; then
    cd ~/.zsh/zsh-completions && git pull
else
    git clone --depth=1 https://github.com/zdharma/zsh-completions ~/.zsh/zsh-completions
fi

# zsh-history-substring-search
if [ -d "~/.zsh/zsh-history-substring-search" ]; then
    cd ~/.zsh/zsh-history-substring-search && git pull
else
    git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/zsh-history-substring-search
fi

# installing fonts
echo -e "Installing fonts"

wget -q -N https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P ~/.zsh/fonts
wget -q -N https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P ~/.zsh/fonts
wget -q -N https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P ~/.zsh/fonts
wget -q -N https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P ~/.zsh/fonts

fc-cache -fv ~/.zsh/fonts

echo -e "Fonts installed"

# install powerlevel10k
if [ -d "~/.zsh/powerlevel10k" ]; then
    cd ~/.zsh/powerlevel10k && git pull
else
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k
fi

echo -e "Powerlevel10k installed"


# change shell to zsh

sudo chsh -s /bin/zsh

echo -e "Shell changed to zsh"

sleep 2

echo -e "zsh-install-script.sh is done"

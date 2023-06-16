# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/exa"

# aliases
alias up="sudo apt update"
alias ug="sudo apt upgrade"
alias search="sudo apt search $1"
alias cleanup="sudo apt autoremove"
alias install="sudo apt install $1"
alias list="apt list --upgradable"

# Load and initialise completion system
autoload -Uz compinit
compinit

apt() { 
  command nala "$@"
}
sudo() {
  if [ "$1" = "apt" ]; then
    shift
    command sudo nala "$@"
  else
    command sudo "$@"
  fi
}

# fnm
export PATH="/home/remco/.local/share/fnm:$PATH"
eval "`fnm env`"

export GPG_TTY=\$(tty)

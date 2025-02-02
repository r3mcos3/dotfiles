# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/exa"

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

alias update="sudo nala update"
alias upgrade="sudo nala upgrade"
alias fetch="sudo nala fetch"
alias install="sudo nala install $1"
alias remove="sudo nala remove $1"
alias search="nala search $1"
alias list="nala list --upgradeable"
alias mntha="sshfs root@10.10.2.51:/ homeassistant"

export EDITOR=nvim
export TERM=xterm
export PAGER=most
export TERMINAL=cosmic-term
export VISUAL=nvim
export BROWSER=google-chrome-stable
export PATH="$HOME/.local/bin:$PATH"

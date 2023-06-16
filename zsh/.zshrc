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
alias dot=" cd ~/dotfiles/"
alias ga="git add $1"
alias gc="oc"
alias gs="git status"
alias gp="git push"
alias vim="lvim"
alias nvim="lvim"

export EDITOR=lvim
export TERM=xterm
export PAGER=most
export TERMINAL=kitty
export VISUAL=lvim
export BROWSER=google-chrome-stable
export PATH="$HOME/.local/bin:$PATH"
export GPG_TTY=$(tty)
# fnm
export PATH="/home/remco/.local/share/fnm:$PATH"
eval "`fnm env`"


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


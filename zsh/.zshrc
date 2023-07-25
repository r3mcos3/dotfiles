# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

# aliases
alias cleanup="sudo apt autoremove"
alias dot=" cd ~/dotfiles/"
alias ga="git add $1"
alias gc="opencommit"
alias gp="git push"
alias gs="git status"
alias install="sudo apt install $1"
alias lg="lazygit"
alias list="apt list --upgradable"
alias mnt="./harddisk/git/scripts/ssh/ssh.sh"
alias nvim="lvim"
alias remove="sudo apt remove $1"
alias search="sudo apt search $1"
alias ug="sudo apt upgrade"
alias up="sudo apt update"
alias vim="lvim"
alias wgd="nmcli connection down wg0"
alias wgu="nmcli connection up wg0"

export BROWSER=google-chrome-stable
export EDITOR=lvim
export GPG_TTY=$(tty)
export LVIM_DEV_MODE=1
export PAGER=most
export PATH="$HOME/.local/bin:$PATH"
export PATH="/home/remco/.cargo/bin:$PATH"
export TERM=xterm
export TERMINAL=kitty
export VISUAL=lvim


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

eval "$(atuin init zsh --disable-up-arrow)"

# fnm
export PATH="/home/remco/.local/share/fnm:$PATH"
eval "`fnm env`"

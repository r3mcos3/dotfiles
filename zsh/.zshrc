# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/exa"

alias unraid="sshfs -p 2224 root@10.10.50.60:/mnt/user /home/remco/unraid"
alias ha="sshfs root@10.10.50.149:/config /home/remco/homeassistant"
alias lg="lazygit"
alias wgu="wg-quick up wg0"
alias wgd="wg-quick down wg0"
alias umnt="umount ~/homeassistant/ & umount ~/unraid/"
alias cleanup="sudo pacman -Rns $(pacman -Qtdq)"
alias dot=" cd ~/.dotfiles/"
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
export VISUAL=nvim
export BROWSER=google-chrome-stable
export PATH="$HOME/.local/bin:$PATH"
export GPG_TTY=$(tty)

# Load and initialise completion system
autoload -Uz compinit
compinit

eval "$(atuin init zsh --disable-up-arrow)"


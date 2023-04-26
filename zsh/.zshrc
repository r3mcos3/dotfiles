# Created by Zap installer
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/exa"
plug "wintermi/zsh-starship"
# plug "zap-zsh/fzf"
plug "chivalryq/zsh-autojump"

alias lg="lazygit"
alias wgu="wg-quick up wg0"
alias wgd="wg-quick down wg0"
alias mnth="sshfs root@10.10.50.149:/config ~/homeassistant/"
alias mntu="sshfs -p 2224 root@10.10.50.60:/mnt/user/ ~/unraid/"
alias umnt="umount ~/homeassistant/ & umount ~/unraid/"
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias ca="config add $1" 
alias cc="config commit -m"
alias cp="config push"
alias cs="config status"
alias clean="sudo pacman -Rns $(pacman -Qtdq)"

export EDITOR=lvim
export GPG_TTY=$(tty)
export TERM=xterm
export PAGER=most
export TERMINAL=kitty
export VISUAL=lvim
export BROWSER=google-chrome-stable


neofetch
eval "$(atuin init zsh --disable-up-arrow)"

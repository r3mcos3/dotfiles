# -----------------------------------------------------
# Created by Zap installer
# -----------------------------------------------------
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/exa"

# -----------------------------------------------------
# Load and initialise completion system
# -----------------------------------------------------
autoload -Uz compinit
compinit

# -----------------------------------------------------
# Set-up FZF key bindings (CTRL R for fuzzy history finder)
# -----------------------------------------------------
source <(fzf --zsh)

# -----------------------------------------------------
# Exports
# -----------------------------------------------------
export EDITOR=nvim
export TERM=xterm
export PAGER=most
export TERMINAL=cosmic-term
export VISUAL=nvim
export BROWSER=thorium-browser
export PATH="$HOME/.local/bin:$PATH"
export GPG_TTY=$(tty)

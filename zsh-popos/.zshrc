# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# Plugins
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"


# Load and initialise completion system
autoload -Uz compinit
compinit

# History Settings
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY          # Share history between sessions
setopt HIST_IGNORE_DUPS       # Ignore duplicates
setopt HIST_IGNORE_ALL_DUPS   # Remove older duplicates
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicates first when trimming history
setopt HIST_FIND_NO_DUPS      # Do not display duplicates when searching
setopt HIST_SAVE_NO_DUPS      # Do not save duplicates

# Completion Styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # Colored completion
zstyle ':completion:*' menu select # Interactive selection menu

# Functions
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

# Aliases
alias update="sudo nala update"
alias upgrade="sudo nala upgrade"
alias fetch="sudo nala fetch"
alias install="sudo nala install"
alias remove="sudo nala remove"
alias search="nala search"
alias list="nala list --upgradeable"
alias lg="lazygit"
alias nvim="bob run nightly"

# Eza Aliases (Modern ls replacement)
if command -v eza >/dev/null; then
  alias ls='eza --icons'
  alias ll='eza -l --icons --git -a'
  alias lt='eza --tree --level=2 --icons'
  alias la='eza -l --icons --git -a'
fi

# Environment Variables
export EDITOR=nvim
export VISUAL=nvim
export PAGER=most
export TERMINAL=cosmic-term
export BROWSER=thorium-browser
export GPG_TTY=$(tty)

# Fix TERM if needed, but usually auto-detected. 
# export TERM=xterm-256color 

# Path Configuration
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# Zoxide (Smart cd)
# Replaces cd with z
eval "$(zoxide init zsh --cmd cd)"

# fnm
FNM_PATH="/home/remco/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

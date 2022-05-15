# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob notify
unsetopt nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/remco/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Load aliases and shortcuts if existent.
[ -f "$HOME/.zsh/aliasrc" ] && source "$HOME/.zsh/aliasrc"

source /home/remco/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source /home/remco/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/remco/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/remco/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/autojump/autojump.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

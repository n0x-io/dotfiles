# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [ "$TMUX" = "" ]; then tmux; fi
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


EDITOR=nvim

# Path to your oh-my-zsh installation.
export ZSH="/home/n0x/.oh-my-zsh"

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

ZSH_THEME="powerlevel10k/powerlevel10k"

HIST_STAMPS="yyyy-mm-dd"

plugins=(
  tmux
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
#ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

alias nv="nvim"
alias vim="nvim"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.config/lf/icons ] && source ~/.config/lf/icons

#eval $(thefuck --alias)

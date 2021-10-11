# export path stuff
if [[ $UID -ge 1000 && -d $HOME/.local/bin && -z $(echo $PATH | grep -o $HOME/.local/bin) ]]
then
    export PATH="$HOME/.local/bin:${PATH}"
fi

# start x -> starts dwm within .xinitrc
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
fi


# Alias
alias nv="nvim"
alias vim="nvim"
alias sc="maim -s ~/Pictures/$(date +%s).png"
alias ff="firefox-nightly"

# Java/Android
export ANDROID_SDK_ROOT="$HOME:/Android/Sdk"
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# exporty
export EDITOR=nvim
export ZSH="/home/n0x/.oh-my-zsh"
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
export LIBVIRT_DEFAULT_URI="qemu:///system"

# call pfetch for new terminal
pfetch

# Theming and plugins
ZSH_THEME="powerlevel10k/powerlevel10k"

HIST_STAMPS="yyyy-mm-dd"

plugins=(
  tmux
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
#ZSH_TMUX_AUTOSTART=true


if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.config/lf/icons ] && source ~/.config/lf/icons

#[[ ! -f ~/dotfiles/zsh/.p10k.zsh ]] || source ~/dotfiles/zsh/.p10k.zsh

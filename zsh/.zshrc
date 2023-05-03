autoload -U colors && colors

setopt correct
setopt extendedglob
setopt nocaseglob
setopt rcexpandparam
setopt numericglobsort
setopt nobeep
setopt histignorealldups 
setopt autocd

autoload -U compinit
zstyle ':completion:*' menu select 
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
colors
_comp_options+=(globdots) 
compinit

[[ -r ~/.scripts/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.scripts/znap

source ~/.scripts/znap/znap.zsh

ZSH_AUTOSUGGEST_STRATEGY=completion

znap prompt sindresorhus/pure
znap source zsh-users/zsh-autosuggestions

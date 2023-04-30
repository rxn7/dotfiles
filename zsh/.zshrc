autoload -U colors && colors
PS1="%{$fg[yellow]%}%m%{$fg[white]%}:%{$fg[cyan]%}%~ %{$fg[blue]%}❯%b "

# Tab Completion
autoload -U compinit
zstyle ':completion:*' menu select 
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
colors
_comp_options+=(globdots) 
compinit

setopt correct
setopt extendedglob
setopt nocaseglob
setopt rcexpandparam
setopt numericglobsort
setopt nobeep
setopt histignorealldups
setopt autocd

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

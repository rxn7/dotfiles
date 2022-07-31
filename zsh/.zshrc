autoload -U colors && colors
PS1="%{$fg[cyan]%}%~ %{$fg[blue]%}❯%b "

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

echo "https://maciejniziolek.xyz" | lolcat

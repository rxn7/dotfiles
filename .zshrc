autoload -U colors && colors
PS1="%{$fg[yellow]%}%n %{$fg[cyan]%}%~ %{$reset_color%};%b "

# Tab Completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) 

export KEYTIMEOUT=1

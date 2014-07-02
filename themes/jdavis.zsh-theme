#!/usr/bin/env zsh

PROMPT='%{$fg[cyan]%}[%{$fg[white]%} %n %{$fg[cyan]%}] [%{$fg[white]%}%~%{$fg[cyan]%}] >%{$reset_color%} '
RPROMPT='%{$fg[cyan]%}[%{$fg[white]%}$(git_prompt_info)%{$fg[cyan]%}]%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"

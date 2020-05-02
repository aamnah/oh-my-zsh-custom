# Theme: Amnastic
# Author: Aamnah
# Link: http://aamnah.com
# Lastmod: 2020-05-03

# inspired by af-magic

#use extended color palette if available
if [[ $terminfo[colors] -ge 256 ]]; then
    turquoise="%F{81}"
    tangerine="%F{166}"
    orange="%F{214}"
    purple="%F{105}"
    violet="%F{135}"
    hotpink="%F{161}"
    limegreen="%F{118}"
    green="%F{078}"
    gray="%F{237}"
    blue="%F{032}"
    red="%F{red}"
else
    turquoise="%F{cyan}"
    tangerine="%F{yellow}"
    orange="%F{yellow}"
    purple="%F{magenta}"
    violet="%F{magenta}"
    hotpink="%F{red}"
    limegreen="%F{green}"
    green="%F{green}"
    gray="%F{white}"
    blue="%F{blue}"
    red="%F{red}"
fi

PR_RST="%f"

# settings
# no idea why this `typeset` is better than just plain simple variables. is it even?
typeset +H return_code="%(?..%{$red%}%? ↵%{$PR_RST%})"

# separator dashes size
function dashed_line {
	[[ -n "${VIRTUAL_ENV-}" && -z "${VIRTUAL_ENV_DISABLE_PROMPT-}" && "$PS1" = \(* ]] \
		&& echo $(( COLUMNS - ${#VIRTUAL_ENV} - 3 )) \
		|| echo $COLUMNS
}

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$orange%}*${PR_RST}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${PR_RST}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$green%} ✈"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭"
ZSH_THEME_GIT_PROMPT_DELETED="%{$red%} ✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$gray%} ✱"

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX=" $FG[075]["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"

# primary prompt
PS1='%{$gray%}${(l.$(dashed_line)..-.)}${PR_RST}
%{$blue%}%c %{$turquoise%}$(git_prompt_info) %{$purple%}%(!.#.») ${PR_RST}'

# primary prompt when no git repo
if [ -z "$(git_current_branch)" ]; then 
PS1='%{$gray%}${(l.$(dashed_line)..-.)}${PR_RST}
%{$blue%}%c %{$purple%}%(!.#.») ${PR_RST}'
fi

# Prompt when the last command was unsuccessful
PS2='%{$red%}\ ${PR_RST}'
RPS1='${return_code}'

# right prompt
(( $+functions[virtualenv_prompt_info] )) && RPS1+='$(virtualenv_prompt_info)'
RPS1+=' %{$gray%}%T%{$reset_color%}'
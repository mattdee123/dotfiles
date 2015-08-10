export FCEDIT=vim
export EDITOR=vim
##### Path
export PATH="/usr/local/bin:$PATH"

##### Colors
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32' #light green

export CLICOLOR='1'

export LSCOLORS="gxDxFxdxCxExExhbadgxgx"
# NOTE: the "right" way to do colors would be to use tput, like
# export COLOR_WHITE="$(tput bold && tput setaf 7)"
# 0 - Black
# 1 - Red
# 2 - Green
# 3 - Yellow
# 4 - Blue
# 5 - Magenta
# 6 - Cyan
# 7 - White
# Setup some colors to use later in interactive shell or scripts
export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[1;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'
# removed for situations where there is no term (like scp)
# export UNDERLINE_START="$(tput smul)"
# export UNDERLINE_END="$(tput rmul)"
##### History
export HISTSIZE=100000000
export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=10000000
shopt -s histappend

##### Prompt
if [ -f ~/.gitprompt.sh ];
then
    #included by dotfile install script
    source ~/.gitprompt.sh;
    export GIT_PS1_SHOWDIRTYSTATE="true";
else
    __git_ps1() { true; };
fi;

export TIME_COLOR=$COLOR_GREEN
export NAME_COLOR=$COLOR_BROWN
export DIR_COLOR=$COLOR_PURPLE
export GIT_COLOR=$COLOR_LIGHT_CYAN
export ERR_COLOR=$COLOR_RED

ps1() {
  error="$?"
  # 4x escape: 2x for in string, 2x for in printf
  TIME=`printf "\[$TIME_COLOR\]%s " "[\\\\T]"`
  NAME=`printf "\[$NAME_COLOR\]%s: " "\\\\u"`
  DIR=`printf "\[$DIR_COLOR\]%s " "\\\\w"`
  GIT=`printf "\[$GIT_COLOR\]%s" "$(__git_ps1 '%s ')"`
  EC=`if [ $error -ne 0 ]; then printf "\[$ERR_COLOR\][%s] " "$error"; fi`
  NC=`printf "\[$COLOR_NC\]"`
  export PS1="$TIME$NAME$DIR$GIT$EC$NC"
}

PROMPT_COMMAND=ps1
export PS1=">> "
export PS2='> '
export PS3='#? '
export PS4='+ '

##### Aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias t="tmux a"

alias l="ls -Al"
alias la="ls -a"
# Lists folders and files sizes in the current folder

alias ducks='du -cksh * | sort --human-numeric-sort|head -11'
alias f='find . -iname'
alias gr='grep -r' # Recursive grep
# Shows most used commands, from:lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' \
    | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# Git Aliases
alias gd='git diff'
alias gdc='git diff --cached'
alias gu="$EDITOR ~/.gitconfig"
alias gs='git status'
alias gap='git add $(git rev-parse --show-toplevel); git commit; git push'
alias gitroot='cd $(git rev-parse --show-toplevel)'
alias gc='git commit -m'
alias gpr='git pull --rebase'
alias ga="git commit -a --amend"
alias gg="git grep"
alias grh="git reset --hard"
alias gl="git log --oneline"

function gco {
  if [[ $# == 0 ]]; then
    git checkout master
  else
    git checkout "$@"
  fi
}

alias andrew="ssh afs"
alias andrewx="ssh -X afs"
alias matt="ssh matt"
alias shark="ssh shark"

alias bashrc="vim ~/.bashrc"
alias reload="source ~/.bashrc"
alias sml="rlwrap sml"
alias e="subl"
alias expand="cd \$(pwd -P)"
alias sz="du -hs"
alias tex="pdflatex *.tex"
alias pdf="open *.pdf"
alias localrc="vim ~/.bashrc.local"
function pprint {
    python -c "print $1"
}
[ -f ~/.bashrc.local ] && source ~/.bashrc.local

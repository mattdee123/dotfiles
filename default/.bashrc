export FCEDIT=vim
export EDITOR=vim
# Path
# export PATH="/usr/local/bin:$PATH"
# for i in `ls ~/bindirs`;do
#    temp="$HOME""/bindirs/$i";
#    if [ -e "$temp" ]; then
#         if [ -h "$temp" ]; then
#             export PATH="$PATH:`readlink $temp`";
#         else
#             export PATH="$PATH:~/bindirs/$i";
#         fi;
#    fi;
# done
# unset temp

##### Colors
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32' #light green

export CLICOLOR='1'

export LSCOLORS="gxDxFxdxCxExExhbadgxgx"

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

ps1() {
  error="$?"
  # 4x escape: 2x for in string, 2x for in printf
  DATE=`printf "\[$COLOR_GREEN\]%s " "[\\\\T]"`
  NAME=`printf "\[$COLOR_BROWN\]%s: " "\\\\u"`
  DIR=`printf "\[$COLOR_PURPLE\]%s " "\\\\w"`
  GIT=`printf "\[$COLOR_LIGHT_CYAN\]%s" "$(__git_ps1 '%s ')"`
  EC=`if [ $error -ne 0 ]; then printf "\[$COLOR_RED\][%s] " "$error"; fi`
  NC=`printf "\[$COLOR_NC\]"`
  export PS1="$DATE$NAME$DIR$GIT$EC$NC"
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

alias l="ls -Al"

alias ip="ifconfig | grep 'inet '"
# Lists folders and files sizes in the current folder

alias ducks='du -cksh * | sort --human-numeric-sort|head -11'
alias f='find . -iname'
alias gr='grep -r' # Recursive grep
alias top='top -o cpu'
# Shows most used commands, from:lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' \
    | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# Git Aliases
alias gd='git diff'
alias gu="$EDITOR ~/.gitconfig"
alias gs='git status'
alias gap='git add $(git rev-parse --show-toplevel); git commit; git push'
alias gitroot='cd $(git rev-parse --show-toplevel)'
alias gc='git commit -m'
alias gpr='git pull --rebase'
alias ga="git commit -a --amend"

function gco {
  if [[ $# == 0 ]]; then
    git checkout master
  else
    git checkout "$@"
  fi
}

alias andrew="ssh afs"
alias matt="ssh matt"
alias shark="ssh shark"

alias bashrc="subl ~/.bashrc"
alias sml="rlwrap sml"
alias e="subl"
alias expand="cd \$(pwd -P)"
alias sz="du -hs"
alias tex="pdflatex *.tex"
alias pdf="open *.pdf"
if [ -f ~/.bashrc.local];
then
    source ~/.bashrc.local;
fi

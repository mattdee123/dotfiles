export FCEDIT=vim
export EDITOR=vim
##### Path
export PATH="~/bin:/usr/local/bin:$PATH"

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
export HISTCONTROL=ignoreboth
export HISTFILESIZE=10000000
export HISTTIMEFORMAT='%F %T '
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

export TIME_COLOR=$COLOR_LIGHT_GREEN
export NAME_COLOR=$COLOR_BROWN
export DIR_COLOR=$COLOR_PURPLE
export GIT_COLOR=$COLOR_LIGHT_CYAN
export ERR_COLOR=$COLOR_RED

ps1() {
  error="$?"
  history -a
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

alias t="tmux a -t main"

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
alias gdm='git diff `git merge-base master HEAD`'
alias gdms='gdm --stat'
alias gb='git branch'
alias gu="$EDITOR ~/.gitconfig"
alias gs='git status'
alias gl='git log'
alias gap='git add $(git rev-parse --show-toplevel); git commit; git push'
alias gitroot='cd $(git rev-parse --show-toplevel)'
alias gc='git commit -m'
alias gpr='git pull --rebase'
alias ga='git add -u .'
alias gca='git commit --amend'
function squash {
    if [[ $# == 0 ]]; then
        echo 'must provide an argument'
    else
        git reset --soft "$(git merge-base master HEAD)" && git commit -m "$1"
    fi
}

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
alias localrc="vim ~/.bashrc.local"
alias vimrc="vim ~/.vimrc"
alias reload="source ~/.bashrc"
alias sml="rlwrap sml"
alias v='vim "$(FZF)"'
alias vu='vim "$(ag -ug "" | FZF)"'
#alias v="vim -c ':FZF'"
alias expand='cd "$(pwd -P)"'
alias sz="du -hs"
alias tex="pdflatex *.tex"
alias pdf="open *.pdf"
function tosql {
    awk "\$0=\"'\"\$0\"',\""
}

function pprint {
    python -c "print($1)"
}

function down {
    curl "https://3566.me/""$1"
}

function lastdl {
    fname="$(ls -t ~/Downloads/ | head -n 1)"
    echo "$HOME/Downloads/$fname"
}

function lastdesk {
    fname="$(ls -t ~/Desktop/ | head -n 1)"
    echo "$HOME/Desktop/$fname"
}


function colors {
    for i in {0..255} ; do
        printf "\x1b[38;5;${i}mcolour${i}\n"
    done
}

[ -f ~/.bashrc.local ] && source ~/.bashrc.local
true

export FZF_DEFAULT_COMMAND='ag -g ""'

function dead_branches() {
    git fetch -p  # check if remote branches are deleted
    git branch --format '%(upstream:track,nobracket)%(upstream:trackshort):%(refname:short)' | grep '^\(gone\)\?:' | cut -d : -f 2
}

function delete_dead_branches() {
    for brname in $(dead_branches)
    do
        read -r -p "delete branch: $brname? [y/N] " response
        if [ "$response" = 'y' ]
        then
            git branch -D $brname
        fi
    done
}

function delete_deploy_branches() {
    for brname in $(git branch | grep '  deploy')
    do
        read -r -p "delete branch: $brname? [y/N] " response
        if [ "$response" = 'y' ]
        then
            git branch -D $brname
        fi
    done
}


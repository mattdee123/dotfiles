export FCEDIT=vim
# Path
export PATH="/usr/local/bin:$PATH"
for i in `ls ~/bindirs`;do 
   temp="$HOME""/bindirs/$i";
   if [ -e "$temp" ]; then
        if [ -h "$temp" ]; then 
            export PATH="$PATH:`readlink $temp`";
        else
            export PATH="$PATH:~/bindirs/$i";
        fi;
   fi;
done
unset temp

# Colors ----------------------------------------------------------
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

export CLICOLOR='1'

# alias ls='ls -G'  # OS-X SPECIFIC - the -G command in OS-X is for colors, in Linux it's no groups
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

export HISTSIZE=10000000

# Don't put duplicate lines in the history.
export HISTCONTROL=ignoredups
# ... and ignore same successive entries.
export HISTCONTROL=ignoreboth

source ~/.gitprompt.sh
export GIT_PS1_SHOWDIRTYSTATE="true"

ps1() {
  error="$?"
  # echo $error
  DATE=`printf "\[$COLOR_GREEN\]%s " "[\\\\T]"`
  NAME=`printf "\[$COLOR_BROWN\]%s: " "\\\\u"`
  DIR=`printf "\[$COLOR_PURPLE\]%s " "\\\\w"`
  GIT=`printf "\[$COLOR_LIGHT_CYAN\]%s" "$(__git_ps1 '%s ')"`
  EC=`if [ $error -ne 0 ]; then printf "\[$COLOR_RED\][%s] " "$error"; fi`
  NC=`printf "\[$COLOR_NC\]"`
  export PS1="$DATE$NAME$DIR$GIT$EC$NC"

  # export PS1="$NAME$NC zzzzzzz"
}

PROMPT_COMMAND=ps1
export PS1=">> "
export PS2='> '
export PS3='#? '
export PS4='+ '

pman() {
  man -t "$1" | open -f -a /Applications/Preview.app
}

# Convenient stuff
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias l="ls -GAl"

alias ip="ifconfig | grep 'inet '"
# Lists folders and files sizes in the current folder
alias ducks='du -cksh * | sort --human-numeric-sort|head -11'
alias f='find . -iname'
alias gr='grep -r' # Recursive grep
alias top='top -o cpu'
# Shows most used commands, from:lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' \
    | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# Git
alias gb='git branch -v'
alias gd='git diff'
alias gu="$EDITOR ~/.gitconfig"
alias gs='git status'
alias gap='git add $(git rev-parse --show-toplevel); git commit; git push'
alias gitroot='cd $(git rev-parse --show-toplevel)'
alias gc='git commit -m'
alias gpr='git pull --rebase'

function gco {
  if [[ $# == 0 ]]; then
    git checkout master
  else
    git checkout "$@"
  fi
}
# deploys to mattdee123.com
function deploy() {
  cd /Users/mattdee/mattdee123.com/www
  echo "Deploying to commit $(git log -n 1 --oneline HEAD)"
  ssh matt "cd mattdee123.com && git fetch && git checkout $(git rev-parse HEAD)"
  cd -
}

alias andrew="ssh afs"
alias matt="ssh matt"
alias shark="ssh shark"

alias amend="git commit -a --amend"
alias bashrc="subl ~/.bashrc"
alias sml="rlwrap sml"
alias e="subl"
alias expand="cd \$(pwd -P)"
alias o="open"
alias sz="du -hs"
alias tex="pdflatex *.tex"
alias pdf="open *.pdf"

# for sshfs stuff
alias fsafs="sshfs afs: ~/afs"
alias fsmatt="sshfs matt: ~/matt"
alias server="python -m SimpleHTTPServer"
alias sl="while true; do super-sl; done"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_25.jdk/Contents/Home

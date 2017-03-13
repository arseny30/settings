# ~/.bashrc: executed by bash(1) for non-login shells.

# History
export HISTTIMEFORMAT="%h %d %H:%M:%S> "
#export HISTCONTROL=ignoredups
export HISTCONTROL=ignoredups:erasedups:ignorespace
export HISTSIZE=1000000
shopt -s histappend

# '<hostname>:<directory>$ '
export PS1='\h:\w\$ '

# Initial value of file permission bits for newly created files
umask 022

# utf8
export LANG=ru_RU.UTF-8
export LC_ALL=ru_RU.UTF-8

# Colorized ls
if which dircolors >/dev/null; then
  export LS_OPTIONS='--color=auto'
  eval "`dircolors`"
  alias ls='ls $LS_OPTIONS'
  alias ll='ls $LS_OPTIONS -l'
  alias l='ls $LS_OPTIONS -lA'
else
  export CLICOLOR=1
  export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
fi

# make and ninja aliases with notifications
function notify() {
 osascript -e "display notification \"$1\" with title \"Term\" sound name \"Ping\""
}

function notify_after_command() {
 $@;
 notify "$*";
}

alias make='notify_after_command nice -n6 make'
alias ninja='notify_after_command nice -n6 ninja'


# Utils
function range () {
    if [ $1 -ge $2 ]; then
        return
    fi
    a=$1
    b=$2
    while [ $a -le $b ]; do
        echo $3$a$4; a=$(($a+1)); done
}

export range


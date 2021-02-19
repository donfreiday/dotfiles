# ~/.bashrc: executed by bash(1) for non-login shells.

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
#HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth
HISTIGNORE="ls:ps:history"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=-1
HISTFILESIZE=-1

# save history immediately, rather than on close.
PROMPT_COMMAND='history -a' 

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Correct typos when changing directory
shopt -s cdspell

# Git branch name in prompt
brname () {
  a=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ -n "$a" ]; then
    echo " [$a]"
  else
    echo ""
  fi
}

export COLOR_NC='\e[0m' # No Color
export COLOR_BLACK='\e[0;30m'
export COLOR_GRAY='\e[1;30m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_LIGHT_GRAY='\e[0;37m'
export COLOR_WHITE='\e[1;37m'


if [ "$UID" = 0 ]; then
    PS1="$COLOR_RED\u$COLOR_NC@$COLOR_RED\H$COLOR_NC:$COLOR_CYAN\w$COLOR_NC\\n$COLOR_RED#$COLOR_NC "
else
    PS1="$COLOR_PURPLE\u$COLOR_NC@$COLOR_CYAN\H$COLOR_NC:$COLOR_GREEN\w$COLOR_NC$COLOR_CYAN\$(brname)\n$COLOR_GREEN\$$COLOR_NC "
fi

alias ll='ls -lAh'
# -R: show ANSI colors correctly; -i: case insensitive search
LESS="-R -i"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Caps lock as Super
setxkbmap -option caps:super

export EDITOR=vim

alias dotfiles='/usr/bin/git --git-dir=/home/don/.dotfiles/ --work-tree=/home/don'
alias ll='ls --color=auto -lAhF'
alias ls='ls --color=auto'

# Bash completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

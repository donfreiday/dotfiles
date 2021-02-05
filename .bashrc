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
PS1="\u@\h:\w\$(brname)$ "

if [ "$UID" = 0 ]; then
    PS1="$red\u$nc@$red\H$nc:$CYAN\w$nc\\n$red#$nc "
else
    PS1="$PURPLE\u$nc@$CYAN\H$nc:$GREEN\w$nc$CYAN\$(brname)\n$GREEN\$$nc "
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

# Bash completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

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


# -R: show ANSI colors correctly; -i: case insensitive search
LESS="-R -i"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export EDITOR=vim

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

alias dotfiles='/usr/bin/git --git-dir=/home/don/.dotfiles/ --work-tree=/home/don'
alias ls='ls --color=auto'
alias ll='ls -lAhF'

# Bash completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

#######################################################
# Set the ultimate amazing command prompt
# Modified from https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c
#######################################################

function __setprompt
{
	local LIGHTGRAY="\033[0;37m"
	local WHITE="\033[1;37m"
	local BLACK="\033[0;30m"
	local DARKGRAY="\033[1;30m"
	local RED="\033[0;31m"
	local LIGHTRED="\033[1;31m"
	local GREEN="\033[0;32m"
	local LIGHTGREEN="\033[1;32m"
	local BROWN="\033[0;33m"
	local YELLOW="\033[1;33m"
	local BLUE="\033[0;34m"
	local LIGHTBLUE="\033[1;34m"
	local MAGENTA="\033[0;35m"
	local LIGHTMAGENTA="\033[1;35m"
	local CYAN="\033[0;36m"
	local LIGHTCYAN="\033[1;36m"
	local NOCOLOR="\033[0m"
	
	# User
	PS1="\[${GREEN}\]\u"

	# @
	PS1+="\[${NOCOLOR}\]@"

	# Host
	PS1+="\[${LIGHTBLUE}\]\H"

	# :
	PS1+="\[${NOCOLOR}\]:"
	
	# Directory
	PS1+="\[${LIGHTGREEN}\]\w"
	
	# Git branch name
	brname () {
  		a=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  		if [ -n "$a" ]; then
    			echo " [$a]"
  		else
    			echo ""
  		fi
	}

	PS1+="\[${LIGHTCYAN}\]\$(brname)"
	
	PS1+="\n"

	if [[ $EUID -ne 0 ]]; then
		PS1+="\[${GREEN}\]$" # Normal user
	else
		PS1+="\[${RED}\]#" # Root user
	fi

	PS1+="\[${NOCOLOR}\] "

	# PS2 is used to continue a command using the \ character
	# PS2="\[${DARKGRAY}\]>\[${NOCOLOR}\] "

	# PS3 is used to enter a number choice in a script
	# PS3='Please enter a number from above list: '

	# PS4 is used for tracing a script in debug mode
	# PS4='\[${DARKGRAY}\]+\[${NOCOLOR}\] '
}
PROMPT_COMMAND='__setprompt'

# this is jon tamir's public bashrc for mac osx

# color definitions
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
WHITE='\e[0;37m'

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
	PS1="\[$GREEN\]\u@\h \[$CYAN\]\w\[$GREEN\] \$\[$WHITE\] "
	#PS1="\[\e[$GREEN\]\]\u@\h \[\e[$CYAN\]\]\w/\[\e[$GREEN\]\] \$\[\e[$WHITE\]\] "
	#PS1='\[\032[1m\033[32m\]\u@\h \w\[\033[0m\]\$ '

    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    #PS1='\[\033[0;32m\]\u@\h \w\$ \[\033[0;38m\]'
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


# ssh shortcuts
alias sshmikgiant='ssh -Y mikgiant'
alias sshmikbull='ssh -Y mikbull'
alias sshmikshoov='ssh -Y mikshoov'
alias sshsurbeck='ssh -Y surbeck7t'
alias sshdr4='ssh -Y dr4'
alias sshindy='ssh -Y indy'


# history bindings
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

# append to and read from .bash_history after every command
#export PROMPT_COMMAND="history -a; history -n"


# system variables
export LSCOLORS=exfxbxdxcxegedabagacad
export SVN_EDITOR=vim

# CUDA
#export PATH=$PATH:/Developer/NVIDIA/CUDA/bin
#export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA/lib:$DYLD_LIBRARY_PATH

# BART
export TOOLBOX_PATH=/Users/jtamir/dev/bart_git
export PATH=$TOOLBOX_PATH:$PATH
source $TOOLBOX_PATH/scripts/bart_completion.sh
export DEBUG_LEVEL=5
export OMP_NUM_THREADS=4

if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
	. /opt/local/etc/profile.d/bash_completion.sh
fi

export PATH=/Users/jtamir/.local/bin:$PATH
source /Users/jtamir/.secret_keys

##
# Your previous /Users/jtamir/.bash_profile file was backed up as /Users/jtamir/.bash_profile.macports-saved_2016-11-13_at_14:23:36
##

# MacPorts Installer addition on 2016-11-13_at_14:23:36: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH=/Users/jtamir/bin:$PATH


# added by Miniconda3 4.3.14 installer
export PATH="/Users/jtamir/miniconda3/bin:$PATH"

export PYTHONPATH=/Users/jtamir/bart/python:$PYTHONPATH

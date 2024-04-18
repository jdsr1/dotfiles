# Dotfile:     bash configuration
# Last Change: 2024.04.18


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Shell extensions
shopt -s extglob

# Bash history. See bash(1) for more options
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# Update window size
shopt -s checkwinsize

# Friendlier less. See lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Shell prompt. Requieres pretty-git-prompt package.
#export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\] \w\[\033[00m\]\$ '
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\] \w\[\033[00m\]\[\033[0;31m\]$(pretty-git-prompt)\[\033[00m\]\$ '

# Machine alias (local)
alias germanio="ssh -X group@148.247.92.9"
alias silicio="ssh -X diego@148.247.92.8"
alias rodio="ssh -X diego@192.168.11.12"
alias iridio="ssh -X diego@192.168.11.13"

# Machine alias (not local)
# alias germanio="ssh -X group@148.247.92.9"
# alias silicio="ssh -tX group@148.247.92.9 ssh -X diego@148.247.92.8"
# alias qt50="ssh -tX group@148.247.92.9 ssh -tX diego@148.247.92.8 ssh -X diego@192.168.11.60"
# alias iridio="ssh -tX group@148.247.92.9 ssh -tX diego@148.247.92.8 ssh -X diego@192.168.11.13"
# alias rodio="ssh -tX group@148.247.92.9 ssh -tX diego@148.247.92.8 ssh -X diego@192.168.11.12"

# Other alias
alias vu="VuChem -shmSize 250"
alias qa="ps -lu diego | grep deMon"

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Variables
export PATH=$PATH:/home/diego/bin
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Intel Parallel Studio 2013
source /opt/intel/composer_xe_2013_sp1.3.174/bin/compilervars.sh intel64
source /opt/intel/inspector_xe_2013/inspxe-vars.sh > /dev/null 2>&1
source /opt/intel/vtune_amplifier_xe_2013/amplxe-vars.sh > /dev/null 2>&1
source /opt/intel/composer_xe_2013_sp1.3.174/mkl/bin/mklvars.sh intel64
source /opt/intel/composer_xe_2013_sp1.3.174/mpirt/bin/intel64/mpivars.sh

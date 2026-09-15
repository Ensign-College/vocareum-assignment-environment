# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#
# Modifed by erik.falor@ensign.edu
# Version: 1.2
# Date: Tue Sep 15 2026

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1337
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Bash Options for improved user experience
shopt -s \
    autocd \
    cdspell \
    checkhash \
    checkjobs \
    dotglob \
    execfail \
    extglob \
    histappend \
    no_empty_cmd_completion \
    nullglob \
    promptvars \


# Program used to edit command lines with C-X C-E
# also used by external programs (such as Git)
export EDITOR=nano # vim | emacs
export COLORTERM=yes  # needed for some programs such as diff(1)

# make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

# less(1) pager configuration, including colorized man pages
#   https://www.howtogeek.com/683134/how-to-display-man-pages-in-color-on-linux/
export PAGER=less
export LESS='--RAW-CONTROL-CHARS --jump-target=3'
export LESS_TERMCAP_md=$'\e[01;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_so=$'\e[47;90m'
export LESS_TERMCAP_se=$'\e[0m'

# set variable identifying the chroot you work in (used in the prompt below)
if [[ -z "${debian_chroot:-}" && -r /etc/debian_chroot ]]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [[ -n "$force_color_prompt" ]]; then
	if [[ -x /usr/bin/tput ]] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

VOC_INITIATOR_NAME=${VOC_INITIATOR_EMAIL%@*}

if [[ "$color_prompt" == yes ]]; then
	if [[ $VOC_INITIATOR_EMAIL == $VOC_USER_EMAIL ]]; then
		# Instructor configuring course == magenta username@host
		PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]${VOC_INITIATOR_NAME:-\u}@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	else
		# Student View == green username@host
		PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]${VOC_INITIATOR_NAME:-\u}@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	fi
else
	PS1='${debian_chroot:+($debian_chroot)}${VOC_INITIATOR_NAME:-\u}@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}${VOC_INITIATOR_NAME:-\u}@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [[ -x /usr/bin/dircolors ]]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Prevent CTRL-S from pausing the terminal
# This keyboard shortcut now invokes forward command searching
#   https://en.wikipedia.org/wiki/Software_flow_control
#   stty(1)
stty -ixon

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [[ -f ~/.bash_aliases ]]; then
    source ~/.bash_aliases
fi

# Safety Measures
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Convenience
alias date='date +"%a, %b %e %Y  %R %Z"'
alias df='df -h'
alias diff='diff --color=auto'
alias diffu='diff --color=auto --unified'
alias du='du -h'
alias epoch='command date +%s'
alias findd='find . -type d -name'
alias findf='find . -type f -name'
alias grepi='grep --ignore-case --line-number --color=auto'
alias grepv='grep --invert-match --line-number --color=auto'
alias nl='nl -ba'
alias pd=pushd
alias rl=readlink

# Common variations of ls(1)
alias l='ls --color=auto -CF'
alias la='ls --color=auto -Fa'
alias ll='ls --color=auto -Flh'
alias lla='ls --color=auto -Flha'
alias lld='ls --color=auto -Flhd'
alias ls='ls --color=auto -F'
alias lsd='ls --color=auto -Fd'
alias lsq='ls --quoting-style=shell-escape'
alias lsv='ls --color=auto -F1v'
alias lt='ls --color=auto --full-time -Ft'
alias ltr='ls --color=auto -Fltr'


# Attempt to enable programmable completion features.
if ! shopt -oq posix; then
	if [[ -f /usr/share/bash-completion/bash_completion ]]; then
			source /usr/share/bash-completion/bash_completion
	elif [[ -f ~/.bash_completion ]]; then
			source ~/.bash_completion
	fi

	# if one of the preceeding files loaded, source any custom completion scripts
	if [[ -n ${BASH_COMPLETION_VERSINFO} ]]; then
		for comp in /etc/bash_completion.d/* /usr/share/bash-completion/completions/*; do
			source $comp
		done
	fi
fi

[[ -d /opt/opam ]] && export OPAMROOT=/opt/opam

[[ -x /usr/local/vocareum/scripts/vocinstall.sh ]] && alias vocinstall=/usr/local/vocareum/scripts/vocinstall.sh

# The exit status of sourcing this file depends on the last command run;
# Running true(1) ensures that sourcing this file appears successful because
# the previous && expression may have failed
true

# vim: set shiftwidth=2 tabstop=2 noexpandtab:

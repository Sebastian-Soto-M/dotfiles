
# COLORS
RESTORE='\033[0m'

clrRED='\033[00;31m'
clrGREEN='\033[00;32m'
clrYELLOW='\033[00;33m'
clrBLUE='\033[00;34m'
clrPURPLE='\033[00;35m'
clrCYAN='\033[00;36m'
clrLIGHTGRAY='\033[00;37m'

clrLRED='\033[01;31m'
clrLGREEN='\033[01;32m'
clrLYELLOW='\033[01;33m'
clrLBLUE='\033[01;34m'
clrLPURPLE='\033[01;35m'
clrLCYAN='\033[01;36m'
clrWHITE='\033[01;37m'
# COLORS

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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

color_branch() {
    __git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    }
local gb=$(__git_branch)
if [ ${#gb} -gt 1 ]; then
    echo -e " $clrLPURPLE$gb$RESTORE"
else
    echo ""
fi
}

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(color_branch)\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w $(color_branch)\$ '
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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

export PATH=$PATH:$HOME/.cargo/bin

# this was my bash profile
if [ -e /home/snsm/.nix-profile/etc/profile.d/nix.sh ]; then . /home/snsm/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
# this was my bash profile

export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"

# Kitty conf
export TERMINAL="kitty"
source <(kitty + complete setup bash)

export LF_ICONS="di=:fi=:ln=:or=:ex=:*.c=:*.cc=:*.cpp=ﭱ:*.js=:*.vimrc=:*.vim=:*.nix=:*.css=:*.pdf=:*.html=:*.rs=:*.rlib=:*.7z=:*.git=:*.webm=:*.mp4=:*.flac=:*.deb=:*.rpm=:*.py=:*.md=:*.json=ﬥ:*.mkv=:*.go="
# export PATH=/home/snsm/anaconda3/bin:$PATH
# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/snsm/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/snsm/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/snsm/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/snsm/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

# conda deactivate

# Fzf conf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FD_OPTIONS="-Hi --follow --exclude .git --exclude node_modules --exclude __pycache__"
export FZF_DEFAULT_OPTS="
--no-mouse --height 50% -1 --reverse --multi --inline-info
--preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {} ) 2> /dev/null | head -300'
--preview-window='right:hidden:wrap'
--bind='f3:execute(bat --style=numbers {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
"
export FZF_CTRL_T_OPTS="--select-1 --exit-0"
export FZF_ALT_C_OPTS="--select-1 --exit-0"
export FZF_DEFAULT_COMMAND="fdfind -t f -t d $FD_OPTIONS"
export FZF_CTRl_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fdfind --type d $FD_OPTIONS"

fif() {
    if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
    rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# Modified version where you can press
#   - CTRL-O to open with `xdg-open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() (
IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o)")
key=$(head -1 <<< "$out")
file=$(head -2 <<< "$out" | tail -1)
if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && xdg-open "$file" || ${EDITOR:-nvim} "$file"
fi
)

export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"

export WORKON_HOME=$HOME/environments/
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh

eval "$(starship init bash)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/snsm/.sdkman"
[[ -s "/home/snsm/.sdkman/bin/sdkman-init.sh" ]] && source "/home/snsm/.sdkman/bin/sdkman-init.sh"


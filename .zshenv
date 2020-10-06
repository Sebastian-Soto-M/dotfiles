# XDG DEFAULT FOLDERS

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

export HISTFILE="$XDG_DATA_HOME"/zsh/history
export HISTSIZE=60000
export ZDOTDIR=$HOME/.config/zsh
export ZSH=$HOME/.config/zsh/oh-my-zsh
export ZSH_CUSTOM=$ZSH/custom

export ASDF_DATA_DIR="$XDG_CONFIG_HOME"/asdf
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GOPATH="$XDG_DATA_HOME"/go
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export SDKMAN_DIR="$XDG_DATA_HOME"/sdkman

export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
# run this command: echo hsts-file \= "$XDG_CACHE_HOME"/wget-hsts >> "$WGETRC"

export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority


export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc

export TASKRC="$XDG_CONFIG_HOME"/task/taskrc
export TASKDATA="$XDG_DATA_HOME"/task
export TIMEWARRIORDB="$TASKDATA"/timewarrior

export SCRIPTS="$XDG_CONFIG_HOME/scripts"

export PATH="$HOME/.local/bin:$PATH"

export PATH=$PATH"$(find $SCRIPTS -type d -printf ':%p')"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep dwm || startx "$XINITRC"
fi


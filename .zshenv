# XDG DEFAULT FOLDERS

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

export ZSH=$HOME/.config/zsh/oh-my-zsh
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE="$XDG_DATA_HOME"/zsh/history

export GOPATH="$XDG_DATA_HOME"/go
export ASDF_DATA_DIR="$XDG_CONFIG_HOME"/asdf
export TASKDATA="$XDG_DATA_HOME"/task
export TASKRC="$XDG_CONFIG_HOME"/task/taskrc
export TIMEWARRIORDB="$TASKDATA"/timewarrior

export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

export WGETRC="$XDG_CONFIG_HOME/wgetrc"

export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc

export TASKRC="$XDG_CONFIG_HOME"/task/taskrc
export TASKDATA="$XDG_DATA_HOME"/task

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep dwm || startx "$XINITRC"
fi

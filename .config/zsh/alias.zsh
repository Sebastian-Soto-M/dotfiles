#git
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias unv="/usr/bin/git --git-dir=$HOME/universidad/.unv/ --work-tree=$HOME/universidad"
# alias fm_ignore"git config core.filemode false"

#file edits
edtr=nvim

alias e10="$edtr ~/.p10k.zsh"
alias ealias="$edtr $ZDOTDIR/alias.zsh"
alias envrc="cd ~/.config/nvim/"
alias ep="$edtr ~/.config/picom/picom.conf"
alias etmx="$edtr $XDG_CONFIG_HOME/tmux/tmux.conf"
alias etrc="$edtr $TASKRC"
alias ezsh="$edtr $XDG_CONFIG_HOME/zsh/.zshrc"
alias eze="$edtr $HOME/.zshenv"

#folders
jva=~/code/java
ptn=~/code/python
unv=~/universidad

alias gtcomp="cd $unv/diseño_construcción_de_componentes/"
alias gtssm="cd ~/code/python/web/websites/ssm/"

#shortcuts
alias de="deactivate"
alias ktmx="tmux kill-server"
alias exa='exa --icons'
alias l='exa -lT --level=2'
alias ll='exa -als type'
alias lt='exa -T --icons'
alias la='exa -Dxas size'
alias ls='exa -xas type'
alias nstmux="tmux new -s $1"
alias pf="pip freeze"
alias te="task $1 edit"
alias xclip="xclip -selection clipboard"
alias clpk="colorpicker --short --preview --one-shot"
alias o="xdg-open $1 & disown"
alias m="ncmpcpp"
alias a="alias | fzf"

#taskwarrior
trd='task dtl'
trw='task wk'

alias trd="$trd"
alias trdapi="$trd project:shopped +api"
alias trdapp="$trd project:shopped +app"
alias trdf="$trd | fzf"

alias trw="$trw"

#tools
alias wd="python ~/code/python/automation/automatic_file_manager/app.py"
alias raid_calc="python -i ~/universidad/sistemas_operativos1/materia/src/raid_calc.py"

#program alias
alias vim=$edtr
alias feh="feh -ZF"

#functions
spd=~/code/full_projects/shopped

sapi () {
    cd $spd/api;
    tmux new -s shopped_api;
}
sapp () {
    cd $spd/app;
    tmux new -s shopped_app;
}
flaskinit() {
    source .env;
    workon $1;
    flask run;
}

bt() {
    if [[ $1 == *.md ]]; then glow -p "$1"; else bat "$1"; fi
}

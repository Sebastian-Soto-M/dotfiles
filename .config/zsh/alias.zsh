#git
alias config="/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME"
alias unv="/usr/bin/git --git-dir=$HOME/Documents/university/.unv/ \
--work-tree=$HOME/Documents/university"
# alias fm_ignore"git config core.filemode false"
# config config --local status.showUntrackedFiles no

#file edits
edtr=nvim

alias e10="$edtr $ZDOTDIR/.p10k.zsh"
alias ealias="$edtr $ZDOTDIR/alias.zsh"
alias ebsp="$edtr $XDG_CONFIG_HOME/bspwm/bspwmrc"
alias eks="$edtr $XDG_CONFIG_HOME/sxhkd/sxhkdrc"
alias envrc="cd ~/.config/nvim/"
alias ep="$edtr ~/.config/picom/picom.conf"
alias epl="$edtr $XDG_CONFIG_HOME/polybar/config"
alias etmx="$edtr $XDG_CONFIG_HOME/tmux/tmux.conf"
alias etrc="$edtr $TASKRC"
alias eze="$edtr $HOME/.zshenv"
alias ezsh="$edtr $ZDOTDIR/.zshrc"
alias eini="$edtr $XINITRC"

#folders
jva=~/code/java
ptn=~/code/python
unv=~/universidad

alias gtcomp="cd $unv/diseño_construcción_de_componentes/"
alias gtssm="cd ~/code/python/web/websites/ssm/"

#shortcuts
alias de="deactivate"
alias pf="pip freeze"
alias te="task $1 edit"
alias xclip="xclip -selection clipboard"
alias clpk="colorpicker --short --preview --one-shot"
alias o="xdg-open $1 & disown"
alias m="ncmpcpp"
alias a="alias | fzf"
alias xev="xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf \"%-3s %s\n\", \$5, \$8 }'"
alias lstdeps="expac -S '%r/%n: %D'"

# exa
alias exa='exa --icons'
alias l='exa -lT --level=2'
alias ll='exa -als type'
alias lt='exa -T --icons'
alias la='exa -Dxas size'
alias ls='exa -xas type'

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

# Aliases for software managment
# pacman or pm
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

# yay as aur helper - updates everything
alias pksyua="yay -Syu --noconfirm"
alias upall="yay -Syu --noconfirm"

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
alias dgd="dragon-drag-and-drop" # "dragon-drag-and-drop"
alias cat="bat"

#program alias
alias vim=$edtr
alias feh="feh -ZF"

alias xlog="nvim ~/.local/share/xorg/Xorg.0.log"

alias st="/home/snsm/.config/st/st"
#functions
ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

spd=~/code/full_projects/shopped

flaskinit() {
    source .env;
    workon $1;
    flask run;
}

bt() {
    if [[ $1 == *.md ]]; then glow -p "$1"; else bat "$1"; fi
}

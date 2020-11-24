#git
alias config="/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME"
alias unv="/usr/bin/git --git-dir=$HOME/Documents/university/.unv/ \
    --work-tree=$HOME/Documents/university"
    # alias fm_ignore"git config core.filemode false"
    # config config --local status.showUntrackedFiles no

#file edits
EDITOR=nvim

alias e10="$EDITOR $ZDOTDIR/.p10k.zsh"
alias ealias="$EDITOR $ZDOTDIR/alias.zsh"
alias ebsp="$EDITOR $XDG_CONFIG_HOME/bspwm/bspwmrc"
alias eks="$EDITOR $XDG_CONFIG_HOME/sxhkd/sxhkdrc"
alias envrc="pushd ~/.config/nvim/"
alias ep="$EDITOR ~/.config/picom/picom.conf"
alias epl="$EDITOR $XDG_CONFIG_HOME/polybar/config"
alias etmx="$EDITOR $XDG_CONFIG_HOME/tmux/tmux.conf"
alias etrc="$EDITOR $TASKRC"
alias eze="$EDITOR $HOME/.zshenv"
alias ezsh="$EDITOR $ZDOTDIR/.zshrc"
alias eini="$EDITOR $XINITRC"
alias eau="$EDITOR $XDG_DATA_HOME/dwm/autostart.sh"

#folders
jva=~/code/java
ptn=~/code/python
unv=~/universidad

#shortcuts
alias de="deactivate"
alias pf="pip freeze"
alias te="task $1 edit"
alias xclip="xclip -selection clipboard"
alias clpk="colorpicker --short --preview --one-shot"
alias o="xdg-open $1 & disown"
alias m="ncspot"
alias a="alias | fzf"
alias xev="xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf \"%-3s %s\n\", \$5, \$8 }'"
alias lstdeps="expac -S '%r/%n: %D'"
alias pc="(rm *.orig ; rm *.rej; rm config.h) && sudo make clean install"

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
alias t="taskwarrior-tui"

#timewarrior
alias tws='timew summary :ids'

#tools
alias raid_calc="python -i ~/universidad/sistemas_operativos1/materia/src/raid_calc.py"
alias dgd="dragon-drag-and-drop" # "dragon-drag-and-drop"
alias rm="rmtrash"
alias mvndb="mvnt -Dmaven.surefire.debug"
alias mvnweb="mvn -P-webpack"
#program alias
alias top=bpytop
alias vim=$EDITOR
alias feh="feh -ZF"
alias xlog="nvim ~/.local/share/xorg/Xorg.0.log"
alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"
alias glass="picom --experimental-backends &"
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

vs() {
    files=()
    names=()
    while IFS= read -r -d $'\0'; do
        files+=("$REPLY")
    done < <(fd . -e json "$HOME/templates" -0)

    for (( i = 1; i <= ${#files[@]}; i++ )); do
        f=$files[$i]
        names+=$(basename $f | cut -d"." -f1)
    done
    sel=$(printf "%s\n" "${names[@]}" | fzf +m --prompt="Get vimspector for:")
    echo $sel
    for (( i = 1; i <= ${#files[@]}; i++ )); do
        f=$files[$i]
        n=$(basename $f | cut -d"." -f1)
        [[ $sel == $n ]] && cp $f ".$(echo $f | cut -d '.' -f2-)"
    done
}

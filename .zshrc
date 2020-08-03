# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

######################
# CUSTOM USR CONFIGS #
######################
DISABLE_AUTO_TITLE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
# Use vim keys in tab complete menu:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

######################
# ZSH PLUGIN CONFIGS #
######################
# Path to your oh-my-zsh installation.
export ZSH="/home/snsm/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
# TMUX configuration
ZSH_TMUX_AUTOCONNECT=true
# ALIAS_FINDER
ZSH_ALIAS_FINDER_AUTOMATIC=true
# git auto fetch
GET_AUTO_FETCH_INTERVAL=1200

plugins=(alias-finder fzf git git-auto-fetch gitignore jenv man mvn pip systemd taskwarrior timewarrior tmux virtualenvwrapper web-search zsh_reload) 
source $ZSH/oh-my-zsh.sh

###########################
# TERMINAL TOOLS  CONFIGS #
###########################
# FZF
export FZF_BASE=/usr/bin/fzf
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
export FZF_DEFAULT_COMMAND="fd -t f -t d $FD_OPTIONS"
export FZF_CTRl_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

# virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.8
source $HOME/.local/bin/virtualenvwrapper.sh

######################
#  END-FILE CONFIGS  #
######################
export PATH="$HOME/.local/bin:$PATH"
export SDKMAN_DIR="/home/snsm/.sdkman"
[[ -s "/home/snsm/.sdkman/bin/sdkman-init.sh" ]] && source "/home/snsm/.sdkman/bin/sdkman-init.sh"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# fish like syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

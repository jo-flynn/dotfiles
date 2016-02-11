# pull in git scripts
[[ -f "$HOME/dotfiles/.git_completion.bash" ]] && source "$HOME/dotfiles/.git_completion.bash"
[[ -f "$HOME/dotfiles/.git_prompt.sh" ]] && source "$HOME/dotfiles/.git_prompt.sh"

# keep history "forever"
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoredups
shopt -s histappend

# Git stuff
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWSTASHSTATE=1
export LESSCHARSET=utf-8
export LC_ALL=en_US.UTF-8
export LANG=en_us.UTF-8

# --- Customize Bash Prompt ---
# pwd
# git-branch $
PS1="\n\033[34m\]\w\[\033[0m\]\n\[\033[32m\]\$(__git_ps1 '%s ')\[\033[35m\]\[\033[0;31m\]$ \[\033[0m\]"

# --- Setup Color Vars ---
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
alias tmux="tmux -2"

# -- PATH --
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH

# -- File navigation aliases --
alias cd..='cd ..'
if [ $OSTYPE = "linux-gnu" ]; then
    alias ls='ls -hF --color=auto'
else
    alias ls='ls -hFG'
fi
alias ll='ls -l'
alias lla='ls -la'
alias gw='grunt watch'

# --  Git --
alias gitroot='cd "$(git rev-parse --show-toplevel)"' # cd to root of current git repo

# Color output in grep
alias grep='grep --color=auto'

# WP-CLI
alias wpmt='wp --path=wordpress'

# Autocomplete settings
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# Mount shortcuts
alias mountboom='sshfs -o noappledouble,noapplexattr,workaround=rename,reconnect,volname=www joe@boomstick:/home/joe/www ~/www'

# Change to working directory
function cw() {
    cd ~/www/$1
}

# Add folder completion to cw function
function _cw() {
    local cur opts
    cur="${COMP_WORDS[COMP_CWORD]}"
    if [ $OSTYPE = "linux-gnu" ]; then
        opts=$(cd ~/www ; ls -d --color=never */. | sed 's|/./||')
    else
        opts=$(cd ~/www ; ls -d */. | sed 's|/./||')
    fi
    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
}

complete -F _cw cw

function ct() {
    rootdir=$(git rev-parse --show-toplevel)
    cd $rootdir/wp-content/themes/$1
}

_git_pu() {
    _git_branch
}

_git_po() {
    _git_branch
}

_git_pr() {
    _git_branch
}

_git_switch() {
    _git_branch
}

_git_new() {
    _git_branch
}

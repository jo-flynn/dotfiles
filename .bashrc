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

# colors
black="\e[0;30m"
red="\e[0;31m"
green="\e[0;32m"
orange="\e[0;33m"
blue="\e[0;34m"
purple="\e[0;35m"
cyan="\e[0;36m"
white="\e[0;37m"

# typography
bold="\e[1m"
italic="\e[3m"
reset="\e[0m"

PS1="\n\[$cyan$italic\]\w\[$reset\] \[$purple$italic\]\$(__git_ps1 '%s')\n\[$red\]♥ \[$reset\]"

# --- Setup Color Vars ---
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export TERM=xterm-256color-italic
alias tmux="tmux -2"

# -- PATH --
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=/Applications/Postgres.app/Contents/Versions/9.6/bin/:$PATH
export PATH="$PATH:`yarn global bin`"
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

# -- Dev aliases --
alias rup='bundle exec rails s'
alias rmig='bin/rails db:migrate RAILS_ENV=development'
alias jsup='sudo npm run start:local'

# -- fix bad macOS stuff --
alias macFixCamera='sudo killall VDCAssistant'

function rmigdown() {
  rake db:migrate:down VERSION=$1
}

# Color output in grep
alias grep='grep --color=auto'

# Autocomplete settings
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# Change to working directory
function cw() {
    cd ~/dev/$1
}

# Add folder completion to cw function
function _cw() {
    local cur opts
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts=$(cd ~/dev ; ls -d */. | sed 's|/./||')
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

_git_prf() {
    _git_branch
}

_git_switch() {
    _git_branch
}

_git_new() {
    _git_branch
}

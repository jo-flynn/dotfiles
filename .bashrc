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

# --- Customize Bash Prompt ---
# [machinename] - [pwd] (git-repo)
# username $
PS1="\n\[\033[0;33m\][\h] - [\w]\[\033[0m\]\[\033[32m\]\$(__git_ps1 ' (%s)')\[\033[32m\] \n\[\033[0;36m\]\u \[\033[0;31m\]$ \[\033[0m\]"

# --- Setup Color Vars ---
export CLICOLOR=1
export TERM=xterm-color
export LSCOLORS=ExFxCxDxBxegedabagacad

# -- PATH --
export PATH=/usr/local/bin:$PATH
export PATH

# -- File navigation aliases --
alias cd..='cd ..'
alias ls='ls -hF -G'
alias ll='ls -l'
alias lla='ls -la'

# --  Git --
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --graph --oneline --decorate --all'

# Delete all local, merged branches except hte current one & dev
alias branchclean='git branch | grep -v "\*" | grep -v 'dev' | xargs -n 1 git branch -d'

# cd to root of current git repo
alias gitroot='cd "$(git rev-parse --show-toplevel)"'

# Colored output in grep
alias grep='grep --color=auto'
alias svnlog='svn log -l 10 --verbose'

# Autocomplete settings
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# Mount shortcuts
alias mountboom='sshfs -o workaround=rename,reconnect,volname=www joe@boomstick:/home/joe/www ~/www'

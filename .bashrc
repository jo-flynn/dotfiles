[[ -f "$HOME/.git_completion.bash" ]] && source "$HOME/.git_completion.bash"
[[ -f "$HOME/.git_prompt.sh" ]] && source "$HOME/.git_prompt.sh"
# keep history "forever"
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoredups
shopt -s histappend

# Git stuff
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"

# --- Customize Bash Prompt ---
PS1="\n\[\033[0;33m\][\h] - [\w]\[\033[0m\]\[\033[32m\]\$(__git_ps1)\[\033[32m\]\$(parse_svn_status) \n\[\033[0;36m\]\u \[\033[0;31m\]$ \[\033[0m\]"
# --- Setup Color Vars ---
export CLICOLOR=1
export TERM=xterm-color
export LSCOLORS=ExFxCxDxBxegedabagacad

# -- PATH --
export PATH=/usr/local/bin:$PATH
export PATH

# File navigation aliases
alias cd..='cd ..'
alias ls='ls -F'
alias ll='ls -l'
alias lla='ls -la'

# Git
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gstage='git checkout stage; git merge dev'
alias gprod='git checkout prod; git merge stage'

# Colored output in grep
alias grep='grep --color=auto'

function cdt {
   cd $(find . -name $1 -type d | sed 1q)
}

alias svnlog='svn log -l 10 --verbose'

# Grunt
alias gbw='grunt build-watch'

# Autocomplete settings
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

function parse_git_branch {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

parse_svn_status() {
            local REV=$(                # get svn revision number
                            svn info 2>/dev/null | grep Revision | sed -e 's/Revision: //'
                                                )
                        [ "$REV" ] || return        # stop now if not a working copy

                                         local STATUS=(              # create an array

                                                                   # svn status items (second column is always ' ', 'C', or 'M')
                                                                                                     $( svn st | grep '^[^ ][ CM]' | \

                                                                                                                                                # first column only, filter duplicates
                                                                                                                                                                                                   sed -re 's/^(.).*$/\1/' | awk 'x[$0]++ == 0' )
                                                                                                                                           )
                                                              echo -e "(r$REV) ${STATUS[*]}"

}

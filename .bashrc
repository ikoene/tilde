source ~/.bash/colors
source ~/.bash/functions
source ~/.bash/aliases

# Installed by 'brew install git'
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/tmux
source /usr/local/etc/bash_completion.d/t-completion.sh

# Enable autocomplete for aliases
complete -o default -o nospace -F _git g

ssh_load_autocomplete

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=1

# Prompt
# Thanks @janmoesen for pointing me to the \[\] surrounding the non-printing
# chars.  These are necessary to prevent issues with command line editing,
# -browsing, -completion.
# Added the virtual environment, because sourcing the virtualenv activate code
# did not work for me (__git_ps1() ignores this)
prompt_virtual_env() {
    if test -n "$VIRTUAL_ENV" ; then
        echo " (\[${RED}\]`basename \"$VIRTUAL_ENV\"`\[${NORMAL}\])"
    fi
}
PROMPT_COMMAND='__git_ps1 "\[${REVERSE}\]\[${BLUE}\] \t \[${NORMAL}\] \u@\h \[${BLUE}\]\W\[${NORMAL}\]" "$(prompt_virtual_env)\n$ "'


# Path and environment vars.
PATH="/usr/local/php5/bin:~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
export EDITOR=~/bin/vim
export GIT_EDITOR="$EDITOR"

# Keep more of the command history
export HISTCONTROL=erasedups
export HISTFILESIZE=10000000
export HISTSIZE=1000000

# Vi mode
#set -o vi

archey

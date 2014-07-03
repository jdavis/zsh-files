#
# Loadings
#

#
# OS Specific Loadings
#

if [[ $CURRENT_OS == 'OS X' ]]; then
    # Load autoload if installed with brew
    if [ -f `brew --prefix`/etc/autojump ]; then
        . `brew --prefix`/etc/autojump
    fi
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # None yet
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    # None yet
fi

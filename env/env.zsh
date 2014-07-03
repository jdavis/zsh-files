#
# Env Variables
#

#
# OS Specific Env Variables
#

if [[ $CURRENT_OS == 'OS X' ]]; then
    # OS X Env Variables
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # Linux Env Variables

    if [[ $USER == 'davisjos' ]]; then
        export ECLIPSE_HOME=/opt/eclipse/
    fi
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    # Cygwin Env Variables
fi

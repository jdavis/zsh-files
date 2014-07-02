#
# A function to mimic custom aliases for Tmux. I get tired of having to
# remember Tmux's arbitrary aliases.
#
# To add an alias, just add a line to the $cmds array below. The format is as
# follows:
#   [n num of args, defaults to 1]:[alias]
#       arg1
#       arg2
#       ...
#       argn
# From then on, you can run `t a dev` which will turn into something like `tmux
# attach-session -t dev` which saves a lot of typing.
#
# For the list of all aliases, just run `t help` or anything like that (such
# as -h, --h, --help).
#
#  Author: Josh Davis
# Contact: josh@joshldavis.com
#    Site: http://joshldavis.com
#

# Default command is to make a new session
default=n

# Commands to alias
cmds=(
    2:a
        attach-session
        -t
    2:c
        new-session
        -s
    1:d
        detach-client
    :n
        new-session
)

function t() {
    # Set our default values
    args=()

    # Set first argument to default if it doesn't exist
    first=${1:-$default}

    # If first is a help command
    if [[ $first =~ "^(man|(\-|\-\-)?h(elp)?)$" ]] ; then

        # Print out aliases and quit if only 1 arg
        if [[ $# == 1 ]] ; then
            echo "Tmux aliases:"
            for (( i = 1; i <= ${#cmds[@]}; i = i + 1 )) ; do
                cmd=${cmds[i]}

                if [[ $cmd =~ "([0-9]+)?\:*" ]] ; then
                    # Pull out the length, default to 1
                    len=${${cmd%\:*}:-1}

                    # Pull out the command alias
                    alia=${cmd##*([0-9:])}

                    # Output alias info
                    echo "   ${alia}\ttmux ${cmds[@]:$i:$len} ..."
                    echo

                    # Increment i, since we don't have to worry about the rest
                    i=$(( i + len ))
                fi
            done

            return
        else
            # In help, arg is next command
            help=1
            arg=$2
        fi
    else
        help=0
        arg=$first
    fi

    found=0
    for (( i = 1; i <= ${#cmds[@]}; i = i + 1 )) ; do
        cmd=${cmds[i]}

        # Only if we match the format of an arg
        if [[ $cmd =~ "([0-9]+)?\:${arg}" ]] ; then
            # Pull out the length, again
            len=${${cmd%\:*}:-1}

            # Add args from $i to $len
            args+=${cmds[@]:$i:$len}

            found=1
            break
        fi
    done

    if [[ $found != 1 ]] ; then
        args+=${arg}
    fi

    # Add args rest of args
    args+=${@[2,$#]}

    # Check if help is being ran
    if [[ "$help" == 1 ]] ; then

        # Either print that there is no alias for that
        # or print the alias
        if [[ "$arg" == "$args" ]] ; then
            echo "No tmux alias for '${arg}'"
        else
            echo "Tmux argument '${arg}' aliased to 'tmux ${args}'"
        fi
        return
    fi

    # Run tmux on our newly generated commands
    eval tmux ${args}
}

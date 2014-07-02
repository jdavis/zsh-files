#
# Functions
#

# Display Content of cd folder
function cd() {
    builtin cd $* && ls;
}

#Get IP
function ip-addr() {
    wget -qO- http://ipecho.net/plain
    echo
}

# Display a random Slashdot, HTTP header, Futurama quote
function futurama() {
    curl -Is slashdot.org | egrep ^X-(F|B) | cut -d - -f 2
}

# Time ZSH startup
function zsh-time() {
    time zsh -i -c exit
}

# Run a command or multiple commands without saving it in the $HISTFILE
function incognito() {
    if [ -z $EDITOR ]; then
        EDITOR=vim
    fi

    # Create temp for storing commands
    TEMPFILE=`mktemp -q incognito.XXXXXXXX`

    # Prompt for commands, only run if successful
    $EDITOR $TEMPFILE || {
        echo "Invalid return on the editing"
        return
    }

    # Run the script
    sh $TEMPFILE

    # Clean everything up
    rm -f $TEMPFILE
}

# uncompress depending on extension...
function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)
                tar xvjf $1;;
            *.tar.gz)
                tar xvzf $1;;
            *.bz2)
                bunzip2 $1;;
            *.rar)
                unrar x $1;;
            *.gz)
                gunzip $1;;
            *.tar)
                tar xvf $1;;
            *.tbz2)
                tar xvjf $1;;
            *.tgz)
                tar xvzf $1;;
            *.zip)
                unzip $1;;
            *.Z)
                uncompress $1;;
            *.7z)
                7z x $1;;
            *)
                echo "'$1' cannot be extracted via >extract<";;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

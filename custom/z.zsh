#
# Load the z script:
#   https://github.com/rupa/z
#

# .z is taken by my submodule
# Change it to ~/.zdata
export _Z_DATA=$HOME/.zdata

if [[ ! -f $_Z_DATA ]] ; then
    touch ~/.zdata
fi

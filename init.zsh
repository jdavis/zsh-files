SOURCE=${0%/*}

# Lib
source $SOURCE/lib/completion.zsh
source $SOURCE/lib/git.zsh
source $SOURCE/lib/history.zsh
source $SOURCE/lib/key-bindings.zsh
source $SOURCE/lib/misc.zsh
source $SOURCE/lib/spectrum.zsh
source $SOURCE/lib/termsupport.zsh
source $SOURCE/lib/theme-and-appearance.zsh

# Aliases
source $SOURCE/aliases/aliases.zsh
source $SOURCE/aliases/latex.zsh

# Custom things
source $SOURCE/custom/load.zsh
source $SOURCE/custom/z.zsh

# Env settings
source $SOURCE/env/env.zsh

# Various functions
source $SOURCE/functions/functions.zsh
source $SOURCE/functions/tmux.zsh

# Paths
source $SOURCE/path/paths.zsh

# AWS completion
# TODO: Fix this, some weird things going on with this
#source $SOURCE/completion/aws.zsh

# Colors
source $SOURCE/colors/config.zsh

# Themes
source $SOURCE/themes/jdavis.zsh-theme

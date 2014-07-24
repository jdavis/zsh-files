hash aws_zsh_completer.sh 2> /dev/null || {
    echo no aws
    return
}

source aws_zsh_completer.sh

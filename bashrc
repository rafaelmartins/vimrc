# bashrc file to install my awesome vim setup
# just source this file at the end of ~/.bashrc, no symlinks needed ;)

# helper function that returns the path of the vim directory
get_vim_dir() {
    # will fail if this file is symlinked
    pushd . &> /dev/null
    cd $(dirname "${BASH_SOURCE[0]}") &> /dev/null
    echo "$(pwd)"
    popd &> /dev/null
}

if [[ -f "$(get_vim_dir)/vimrc" ]]; then
    alias vim="vim \
        -c 'set runtimepath=$(get_vim_dir),\$VIMRUNTIME' \
        -c 'source $(get_vim_dir)/vimrc'"
    export EDITOR=vim
else
    echo "Invalid vim setup." >2
fi

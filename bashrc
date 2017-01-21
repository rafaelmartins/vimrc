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

get_system_vimrc() {
    local vimrc="$(vim --version | grep "system vimrc" | cut -d':' -f2)"
    echo "${vimrc//\"}"
}

if [[ -f "$(get_vim_dir)/vimrc" ]]; then
    alias vim="vim -u '$(get_vim_dir)/vimrc'"
    export EDITOR=vim
    export SYSTEM_VIMRC="$(get_system_vimrc)"
    export MY_VIM_DIR="$(get_vim_dir)"
else
    echo "Invalid vim setup."
fi

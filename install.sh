#! /bin/bash

set -e
set -u

ROOT=`pwd`

backup_link () {
    # if the file exists, back it up
    [ -e "$2" ] && mv "$2" "$2.OLD"
    ln -s "$1" "$2"
}

install () {
    # if a link exists, do nothing
    [ -L "$3" ] || (echo "Installing $1" && backup_link "$2" "$3")
}

mkdir -p $HOME/bin

system=`uname -s`
system_arch=`uname -s`-`uname -m`

if [ "$system" == "Linux" ]; then
    mkdir $HOME/.config $HOME/.aptitude
    install i3        "$ROOT/wm/i3/config"              "$HOME/.config/i3/config"
    install i3blocks  "$ROOT/wm/i3/i3blocks_`uname -m`" "$HOME/.config/i3/i3blocks"
    install Xdefaults "$ROOT/x/Xdefaults"               "$HOME/.Xdefaults"
    install Aptitude  "$ROOT/aptitude/config"           "$HOME/.aptitude/config"
fi

install bashrc    "$ROOT/shell/_bashrc"             "$HOME/.bashrc"
install z         "$ROOT/bin/z.sh"                  "$HOME/bin/z.sh"
install vimrc     "$ROOT/editor/_vimrc"             "$HOME/.vimrc"
install gitignore "$ROOT/git/_gitignore_global"     "$HOME/.gitignore_global"
install fzf       "$ROOT/bin/fzf-$system_arch"      "$HOME/bin/fzf"
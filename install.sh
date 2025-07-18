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

system=`uname -s`
system_arch=`uname -s`-`uname -m`

if [ "$system" == "Darwin" ]; then
    code_user_dir="$HOME/Library/Application Support/Code/User"
else
    code_user_dir="$HOME/.config/Code/User"
fi

mkdir -p $HOME/bin $code_user_dir "$HOME/.config/i3"

vim_colors_dir=$HOME/.vim/colors
mkdir -p $vim_colors_dir
mkdir -p $HOME/.config/helix

if [ "$system" == "Linux" ]; then
    mkdir -p $HOME/.config $HOME/.aptitude
    install i3        "$ROOT/wm/i3/config"              "$HOME/.config/i3/config"
    install i3blocks  "$ROOT/wm/i3/i3blocks_`uname -m`" "$HOME/.config/i3/i3blocks"
    install Xdefaults "$ROOT/x/Xdefaults"               "$HOME/.Xdefaults"
    install Xmodmap   "$ROOT/x/Xmodmap"                 "$HOME/.Xmodmap"
    install Aptitude  "$ROOT/aptitude/config"           "$HOME/.aptitude/config"
fi

vimthm="PaperColor.vim"

install bashrc               "$ROOT/shell/_bashrc"                "$HOME/.bashrc"
install kshrc                "$ROOT/shell/_kshrc"                 "$HOME/.kshrc"
install profile              "$ROOT/shell/_profile"               "$HOME/.profile"
install screenrc             "$ROOT/shell/_screenrc"              "$HOME/.screenrc"
install tmux                 "$ROOT/shell/_tmux.conf"             "$HOME/.tmux.conf"
install z                    "$ROOT/bin/z.sh"                     "$HOME/bin/z.sh"
install vimrc                "$ROOT/editor/_vimrc"                "$HOME/.vimrc"
install vim-colors           "$ROOT/editor/_vim/colors/$vimthm"   "$vim_colors_dir/$vimthm"
install gitignore            "$ROOT/git/_gitignore_global"        "$HOME/.gitignore_global"
install fzf                  "$ROOT/bin/fzf-$system_arch"         "$HOME/bin/fzf"
install "VSCode settings"    "$ROOT/editor/code/settings.json"    "$code_user_dir/settings.json"
install "VSCode keybindings" "$ROOT/editor/code/keybindings.json" "$code_user_dir/keybindings.json"
install "VSCode snippets"    "$ROOT/editor/code/snippets"         "$code_user_dir/snippets"
install tmux                 "$ROOT/shell/_tmux.conf"             "$HOME/.tmux.conf"
install "helix config"       "$ROOT/editor/helix/config.toml"     "$HOME/.config/helix/config.toml"
install "helix languages"    "$ROOT/editor/helix/languages.toml"  "$HOME/.config/helix/languages.toml"

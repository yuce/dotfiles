ROOT=`pwd`
BIN_DIR=$HOME/bin

# === install .bashrc ===
if [ -f $HOME/.bashrc ]
then
    mv $HOME/.bashrc $HOME/OLD.bashrc
fi
touch $HOME/.bashrc_private
ln -s $ROOT/shell/_bashrc $HOME/.bashrc

if [ ! -f $BIN_DIR/z.sh ]
then
    ln -s $ROOT/bin/z.sh $BIN_DIR/z.sh
fi

# === install .vimrc ===
if [ -f $HOME/.vimrc ]
then
    mv $HOME/.vimrc $HOME/OLD.vimrc
fi
ln -s $ROOT/editor/_vimrc $HOME/.vimrc

# === install i3 config ===
i3_config_dir=$HOME/.config/i3
i3_config_path=$i3_config_dir/config
if [ -f $i3_config_path ]
then
    mv $i3_config_path OLD.i3_config_path
fi
mkdir -p $i3_config_dir
ln -s  $ROOT/wm/i3/config $i3_config_path

i3blocks_config_dir=$HOME/.i3
i3blocks_config_path=$i3blocks_config_dir/i3blocks.conf
if [ -f $i3blocks_config_path ]
then
    mv $i3blocks_config_path $i3blocks_config_path.OLD
fi
mkdir -p $i3blocks_config_dir
ln -s $ROOT/wm/i3/i3blocks.conf $i3blocks_config_path


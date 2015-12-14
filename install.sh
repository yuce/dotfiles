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


jon tamir's public dot files

=== installation notes
```bash
sudo apt-get install openssh-server vim exuberant-ctags git
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git@github.com:jtamir/dotfiles
cd ~
mv .bashrc .bashrc.OLD
ln -s dotfiles/bashrc .bashrc
ln -s dotfiles/bash_profile .bash_profile
ln -s dotfiles/bash_aliases .bash_aliases
ln -s dotfiles/gitconfig .gitconfig
ln -s dotfiles/tmux.conf .tmux.conf
ln -s dotfiles/vimrc .vimrc
ln -s dotfiles/tmux-update-vars.sh tmux-update-vars.sh
vim +PluginInstall +qall
ln -s ~/dotfiles/vim-syntax ~/.vim/syntax
mkdir bin
ln -s ${HOME}/dotfiles/skelescript.sh bin/skelescript.sh
```

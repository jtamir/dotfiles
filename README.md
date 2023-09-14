jon tamir's public dot files


git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git@github.com:jtamir/dotfiles
cd ~
git checkout -b mac origin/mac
ln -s dotfiles/bashrc .bashrc
ln -s dotfiles/bash_profile .bash_profile
ln -s dotfiles/bash_aliases .bash_aliases
ln -s dotfiles/ssh_aliases .ssh_aliases
ln -s dotfiles/gitconfig .gitconfig
ln -s dotfiles/tmux.conf .tmux.conf
ln -s dotfiles/vimrc .vimrc
ln -s dotfiles/tmux-update-vars.sh tmux-update-vars.sh
ln -s dotfiles/secret_keys.sh .secret_keys
rsync -av --progress dotfiles/bin .
vim +PluginInstall +qall
ln -s ~/dotfiles/vim-syntax ~/.vim/syntax
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
bash ./Miniconda3-latest-MacOSX-arm64.sh
conda create --name pytorch
conda activate pytorch
conda install pytorch torchvision torchaudio -c pytorch
pip install -r dotfiles/requirements.txt

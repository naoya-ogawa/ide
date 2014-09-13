FROM centos:latest
MAINTAINER original <test@example.com>

Run yum -y install vim && yum -y install git
Run mkdir /home/dotfiles
Add _vimrc /home/dotfiles/
Run ln -s /homde/dotfiles/_vimrc /.vimrc
Run mkdir -p /.vim/bundle
Run git clone https://github.com/Shougo/neobundle.vim /.vim/bundle/neobundle.vim

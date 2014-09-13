FROM centos:latest
MAINTAINER original <test@example.com>

RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8
Run yum -y install vim && yum -y install git
Run mkdir /home/dotfiles
Add _vimrc /home/dotfiles/
Run ln -s /homde/dotfiles/_vimrc /.vimrc
Run mkdir -p /.vim/bundle
Run git clone https://github.com/Shougo/neobundle.vim /.vim/bundle/neobundle.vim

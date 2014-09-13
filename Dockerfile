FROM centos:latest
MAINTAINER original <test@example.com>

Run localedef -v -c -i en_US -f UTF-8 en_US.UTF-8
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8
Run yum -y install vim && yum -y install git
Run mkdir /home/dotfiles
Add _vimrc /home/dotfiles/
Run cd / &&  ln -s /homde/dotfiles/_vimrc .vimrc
Run mkdir -p /.vim/bundle
Run git clone https://github.com/Shougo/neobundle.vim /.vim/bundle/neobundle.vim

FROM centos:latest
MAINTAINER original <test@example.com>

Run localedef -f UTF-8 -i ja_JP /usr/lib/locale/ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
Run yum -y install vim && yum -y install git &&  mkdir /home/dotfiles
Add _vimrc /home/dotfiles/
Add update.sh /home/dotfiles/
Run cd / &&  ln -s /home/dotfiles/_vimrc .vimrc &&  mkdir -p /.vim/bundle && git clone https://github.com/Shougo/neobundle.vim /.vim/bundle/neobundle.vim
Run cd /home/dotfiles/ && ./update.sh


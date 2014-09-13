FROM centos:latest
MAINTAINER original <test@example.com>

Run localedef -f UTF-8 -i ja_JP /usr/lib/locale/ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
Run yum -y install vim && yum -y install git
Run mkdir /home/dotfiles
Add _vimrc /home/dotfiles/
Add update.sh /home/dotfiles/update.sh
Run cd / &&  ln -s /home/dotfiles/_vimrc .vimrc
Run mkdir -p /.vim/bundle
Run git clone https://github.com/Shougo/neobundle.vim /.vim/bundle/neobundle.vim

#!/bin/bash

# Install necessary libraries
sudo apt-get update

sudo apt-get install vim nano git

sudo apt-get install build-essential 

# define Vim Settings
cd ~
git clone https://github.com/rim99/fisa-vim-config.git
cd ./fisa-vim-config 
cp .vimrc_combo ~/.vimrc

# define Bash Settings
cat << EOF > ~/.bashrc
PS1='\[\033[32;1m\]\u\[\033[1;37;1m\]@Build-LL-Env:\[\033[1;35;1m\]\w \[\033[32;1m\]-> \[\033[33;1m\]  '
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind 'set match-hidden-files off'
EOF

# install shadowsocks-libev
git clone https://github.com/shadowsocks/shadowsocks-libev.git
cd shadowsocks-libev
sudo apt-get install build-essential autoconf libtool libssl-dev \
    gawk debhelper dh-systemd init-system-helpers pkg-config
dpkg-buildpackage -us -uc -i
cd ..
sudo dpkg -i shadowsocks-libev*.deb

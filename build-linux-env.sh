#!/bin/bash

# Install necessary libraries
sudo apt-get update

sudo apt-get install vim nano git curl

sudo apt-get install build-essential 

# define Vim Settings
cd ~
git clone https://github.com/rim99/fisa-vim-config.git
cd ./fisa-vim-config 
cp .vimrc ~/.vimrc

# define Bash Settings
cat << EOF > ~/.bashrc
PS1='\n\[\033[32;1m\]\u\[\033[1;37;1m\]@Computer:\[\033[1;35;1m\]\w \[\033[32;1m\]\n   -> \[\033[33;1m\]  '
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind 'set match-hidden-files off'
EOF

# install shadowsocks-libev
git clone https://github.com/shadowsocks/shadowsocks-libev.git
cd shadowsocks-libev
mkdir -p ~/tmp-build-shadowsocks/
cp ./scripts/build_deb.sh ~/tmp-build-shadowsocks/
cd ~/tmp-build-shadowsocks
./build_deb.sh
cd ~
rm -rf ~/tmp-build-shadowsocks

#!/bin/bash

# remove any pre-installation of bison
sudo apt remove bison -y && sudo apt-get autoremove -y

# install prerequisites that don't come with the OS
sudo apt install libboost-all-dev flex -y

# download and install older version of bison (2.7.1)
wget http://launchpadlibrarian.net/140087283/libbison-dev_2.7.1.dfsg-1_amd64.deb && sudo dpkg -i libbison-dev_2.7.1.dfsg-1_amd64.deb && rm libbison-dev_2.7.1.dfsg-1_amd64.deb
wget http://launchpadlibrarian.net/140087282/bison_2.7.1.dfsg-1_amd64.deb && sudo dpkg -i bison_2.7.1.dfsg-1_amd64.deb && rm bison_2.7.1.dfsg-1_amd64.deb

# unzip the simulator, configure it, compile it and install it
tar -xvf rcssserver-15.2.2.tar.gz && \
  cd rcssserver-15.2.2 && \
  ./configure --with-boost-libdir=/usr/lib/x86_64-linux-gnu/ && \
  make && \
  sudo make install

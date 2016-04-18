#!/bin/bash
set -x

# Necessary to get Wireshark 1.12 with OpenFlow support in Ubuntu 14.04
add-apt-repository -y ppa:wireshark-dev/stable

add-apt-repository -y ppa:avsm/ppa

apt-get update

apt-get install -y \
  m4 \
  git \
  xterm \
  fortune \
  python-pip \
  libcurl4-openssl-dev \
  python-dev \
  vim \
  python-lxml \
  python-flask \
  python-tornado \
  python-pycurl \
  python-networkx \
  software-properties-common \
  graphviz \
  wireshark \
  ocaml \
  ocaml-native-compilers \
  camlp4-extra \
  opam

# Latest package for Ubuntu 14.04 is 2.1.  Install from source to get Mininet 2.2, which solves
# some port numbering problems, etc.
git clone git://github.com/mininet/mininet.git
cd mininet/util
./install.sh
cd

pip install ryu

# Stop OVS Controller so we can run Frenetic
service openvswitch-controller stop
update-rc.d openvswitch-controller disable

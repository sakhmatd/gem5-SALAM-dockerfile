#!/bin/bash

## Install dependencies ##

# `docker build --no-cache .` to update dependencies
apt-get -y update
apt-get -y install build-essential m4 scons python-dev libprotobuf-dev \
           python-protobuf protobuf-compiler libgoogle-perftools-dev \
           python-pydot python-pydot-ng graphviz gcc-arm-none-eabi \
           cmake lsb-release wget software-properties-common \
           apt-transport-https ca-certificates pypy-six python-six
           pkg-config libpng-dev libhdf5-serial-dev zsh apt-utils libc6-dev-i386

## Install LLVM 3.8 ##
# Import keys and add repo
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key| apt-key add -
apt-add-repository "deb https://apt.llvm.org/xenial/ llvm-toolchain-xenial-3.8 main"

# Removes the warning about self-added key
apt -o Acquire::AllowInsecureRepositories=true update

# Install llvm, clang and lldb
apt-get -y install clang-3.8 lldb-3.8

## Update LLVM paths ##
ln -s /usr/bin/clang-3.8 /usr/bin/clang
ln -s /usr/bin/opt-3.8 /usr/bin/opt
for file in /usr/bin/llvm-*
do
	ln -s $file ${file%-*}
done

## Finally, build gem5-SALAM ##
scons build/ARM/gem5.opt -j`nproc`


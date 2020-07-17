FROM ubuntu:20.04

RUN apt-get update && \
 DEBIAN_FRONTEND=noninteractive apt-get install -y \
 build-essential \ 
 asciidoc \
 binutils \
 bzip2 \
 gawk \
 gettext \
 git \
 libncurses5-dev \
 libz-dev \
 patch \
 python3.5 \
 python2.7 \
 unzip \
 zlib1g-dev \
 lib32gcc1 \
 libc6-dev-i386 \
 subversion \
 flex uglifyjs \
 git-core \
 gcc-multilib \ 
 p7zip \
 p7zip-full \ 
 msmtp \
 libssl-dev \ 
 texinfo  \
 libglib2.0-dev \ 
 xmlto  \
 qemu-utils \ 
 upx \
 libelf-dev \
 autoconf \ 
 automake \
 libtool \
 autopoint \
 device-tree-compiler \
 g++-multilib \
 antlr3 \
 gperf \
 wget \
 swig \
 net-tools \
 openssh-server \
 sudo
 
 ##添加padavan部分依赖 部分软件和上述可能相重合

RUN apt-get update && \
 DEBIAN_FRONTEND=noninteractive apt-get install -y \ 
 unzip libtool-bin curl cmake gperf gawk flex bison nano xxd fakeroot \
 cpio git python-docutils gettext automake autopoint texinfo build-essential help2man \
 pkg-config zlib1g-dev libgmp3-dev libmpc-dev libmpfr-dev libncurses5-dev libltdl-dev wget


RUN useradd -u 10000 openwrt  \
  mkdir -p /var/run/sshd \
  /usr/sbin/sshd -D & \
  chmod u+w /etc/sudoers \
  echo "openwrt ALL=(ALL:ALL) ALL" >> /etc/sudoers \  
  chmod u-w /etc/sudoers \
  echo "OpenWRT-imagebuilder" >> /etc/hostname

RUN apt-get clean && rm -rf /var/lib/apt/lists

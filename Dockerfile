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
 sudo \
 zsh
 
 ##添加padavan部分依赖 部分软件和上述可能相重合

RUN apt-get update && \
 DEBIAN_FRONTEND=noninteractive apt-get install -y \ 
 unzip libtool-bin curl cmake gperf gawk flex bison nano xxd fakeroot \
 cpio git python-docutils gettext automake autopoint texinfo build-essential help2man \
 pkg-config zlib1g-dev libgmp3-dev libmpc-dev libmpfr-dev libncurses5-dev libltdl-dev wget


RUN groupadd -g 10000 openwrt && \
  useradd -r -u 10000 -g openwrt openwrt

  ##useradd -u 10000 openwrt

RUN usermod -s /bin/zsh openwrt
RUN usermod -d /home/openwrt openwrt
RUN echo "root:openwrt" | chpasswd
RUN echo "openwrt:openwrt" | chpasswd
RUN mkdir -p /var/run/sshd
RUN chmod u+w /etc/sudoers
RUN echo "openwrt ALL=(ALL:ALL) ALL" >> /etc/sudoers 
RUN chmod u-w /etc/sudoers
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

RUN apt-get clean && rm -rf /var/lib/apt/lists

ENTRYPOINT [ "/etc/init.d/ssh start" ]
USER openwrt

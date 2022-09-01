FROM quay.io/centos/centos:stream8

RUN dnf install --best --refresh -y \
      git \
      iproute \
      iptables \
      iputils \
      lsscsi \
      mtr \
      net-tools \
      sg3_utils \
      strace \
      tcpdump \
      traceroute \
      udev \
      vim-enhanced \
    && dnf clean all \
    && rm -rf /var/cache/yum \

CMD ["sleep", "infinity"]

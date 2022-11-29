FROM quay.io/centos/centos:stream8

RUN dnf install --best --refresh -y \
      git \
      iproute \
      ethtool \
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

COPY ./network-snapshot.sh /
ENTRYPOINT ["/network-snapshot.sh"]

CMD ["sleep", "infinity"]

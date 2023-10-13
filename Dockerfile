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
      iperf3 \
    && dnf clean all \
    && rm -rf /var/cache/yum 

COPY --chmod=777 network-snapshot.sh /usr/local/bin/network-snapshot.sh

CMD ["sleep", "infinity"]

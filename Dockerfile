FROM quay.io/centos/centos:stream8

RUN dnf install --best --refresh -y \
        tcpdump \
    && dnf clean all \
    && rm -rf /var/cache/yum \

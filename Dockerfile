FROM scratch

ARG VERSION=edge
ENV VERSION=${VERSION}

# curl -o rootfs-edge.tar.xz https://raw.githubusercontent.com/gliderlabs/docker-alpine/rootfs/library-edge/versions/library-edge/rootfs.tar.xz OUT=rootfs-edge.tar.xz

ADD rootfs-${VERSION}.tar.xz /

# Global list of Mirrors can be found here:
# http://rsync.alpinelinux.org/alpine/MIRRORS.txt
# http://alpine.gliderlabs.com/alpine is the fastest mirror by Fastly

ARG APK_REPO=http://alpine.gliderlabs.com/alpine

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/glibc-compat/bin:/usr/glibc-compat/sbin

# Read more https://github.com/sgerrand/alpine-pkg-glibc/releases

COPY glibc-2.25-r0.apk /tmp/glibc-2.25-r0.apk
COPY glibc-bin-2.25-r0.apk /tmp/glibc-bin-2.25-r0.apk
COPY glibc-i18n-2.25-r0.apk /tmp/glibc-i18n-2.25-r0.apk

COPY apk.sh /apk.sh

RUN chmod +x /apk.sh \
  && /apk.sh ${APK_REPO} \
  && apk add --no-cache \
    ca-certificates \
    libgcc \
    tini@community \
  && apk add --allow-untrusted /tmp/glibc-2.25-r0.apk \
  && apk add --allow-untrusted /tmp/glibc-bin-2.25-r0.apk \
  && apk add --allow-untrusted /tmp/glibc-i18n-2.25-r0.apk \
  && ldconfig /lib /usr/lib /usr/glibc-compat/lib \
  && rm -rf \
    /tmp/* \
    /var/cache/apk/*

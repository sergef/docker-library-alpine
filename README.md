# Docker base images

## Alpine

Created from scratch, with seeded Alpine rootfs from
https://github.com/gliderlabs/docker-alpine.

Added glibc packages from https://github.com/sgerrand/alpine-pkg-glibc.

Use APK_REPO build argument to pre-set Alpine mirror from the list
http://rsync.alpinelinux.org/alpine/MIRRORS.txt
or use internal one.

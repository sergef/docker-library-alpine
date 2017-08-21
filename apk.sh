#!/bin/sh

APK_REPO="$1"
APK_REPO_MAIN="${APK_REPO}/${VERSION}/main"
APK_REPO_COMMUNITY="${APK_REPO}/${VERSION}/community"

cat <<EOF > /etc/apk/repositories
$APK_REPO_MAIN
@community $APK_REPO_COMMUNITY
EOF

apk update

#!/bin/sh

APK_REPO="$1"
APK_REPO_MAIN="${APK_REPO}/${VERSION}/main"
APK_REPO_COMMUNITY="${APK_REPO}/${VERSION}/community"
APK_REPO_TESTING="${APK_REPO}/${VERSION}/testing"

cat <<EOF > /etc/apk/repositories
$APK_REPO_MAIN
@community $APK_REPO_COMMUNITY
@testing $APK_REPO_TESTING
EOF

apk update

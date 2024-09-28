#!/bin/bash

echo sign deb package...
token="$(gpg2 --list-key | sed "4q;d" | awk '{print $1}')"
dpkg-sig -sign builder -k $token /task/internal/package.deb

cp /task/internal/package.deb /task/package/package.deb
cp /task/internal/DEB-GPG-KEY-Grigorii-Germashev /task/package/DEB-GPG-KEY-Grigorii-Germashev

echo install deb package...
dpkg -i /task/package/package.deb
echo run deb package...
shell.sh / status > /task/package/script-answer

echo check deb package sign...
dpkg-sig --verify /task/package/package.deb > /task/package/check-key-result

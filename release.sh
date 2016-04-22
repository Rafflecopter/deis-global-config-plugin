#! /usr/bin/env sh

# ex. ./release.sh v0.0.2

set -e

rm -rf /tmp/deis-global-config-release
mkdir /tmp/deis-global-config-release
cp ./deis-global-config ./global-sorcerer /tmp/deis-global-config-release/

git fetch origin gh-pages
git checkout gh-pages
mkdir "./releases/$1"
cp /tmp/deis-global-config-release/* "./releases/$1"
rm -rf /tmp/deis-global-config-release

cd "./releases/$1"

if [ `uname` == 'Darwin' ]; then
    shasum -a 256 "global-sorcerer" \
        > "global-sorcerer.sha256sum"
else
    sha256sum "global-sorcerer" \
        > "global-sorcerer.sha256sum"
fi

cd -

git add "./releases/$1"
git commit -m "release $1"

echo
echo 'Push to gh-pages on github if you are happy with this release.'

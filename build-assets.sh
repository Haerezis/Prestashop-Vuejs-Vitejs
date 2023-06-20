#!/bin/bash

# clean previous assets build
echo "Deleting previous dist assets"
rm -rf modulevitetest/views/dist

# install node modules (in dev mode, to have everything for the build)
echo "yarn install"
yarn install --production=false

# build for production
echo "yarn build"
yarn build || exit 1

echo "$(tput setaf 2)Done"

#!/bin/sh
# Libtiff and giflib are preinstalled on Travis servers, so we need to do an update of those
brew update
brew upgrade libtiff giflib autoconf libtool automake pkg-config
brew install glib cairo freetype fontconfig libpng

#!/bin/sh
# Libtiff and giflib are preinstalled on Travis servers, so we need to do an update of those
brew update
brew update libtiff giflib
brew install autoconf automake libtool pkg-config glib cairo freetype fontconfig libpng

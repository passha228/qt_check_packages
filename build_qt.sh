#!/bin/bash

wget https://download.qt.io/archive/qt/5.15/5.15.4/single/qt-everywhere-opensource-src-5.15.4.tar.xz
tar xf qt-everywhere-opensource-src-5.15.4.tar.xz
cd qt-everywhere-opensource-src-5.15.4
mkdir build && cd build
../configure \
    -prefix "/opt/Qt5.15.4" \
    -release \
    -opensource -confirm-license \
    -nomake examples \
    -nomake tests \
    -qt-zlib \
    -qt-libpng \
    -qt-libjpeg \
    -qt-freetype \
    -qt-pcre \
    -qt-harfbuzz \
    -opengl desktop \
    -no-icu \
    -ssl \
    -widgets \
    -qpa-xcb
gmake
make install
tar czf /opt/Qt5.15.4 qt.tar.gz

#!/bin/sh

gpg --keyserver keys.gnupg.net --recv-keys $UNREALIRCD_GPGKEY ||
    gpg --fingerprint $UNREALIRCD_GPGKEY &&
    curl $UNREALIRCD_URL > unreal.tar.gz &&
    gpg --verify unreal.asc unreal.tar.gz &&
    mkdir unreal && \
    cd unreal && \
    tar xzf ../unreal.tar.gz --strip-components=1

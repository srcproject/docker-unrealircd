#!/bin/sh

cd unreal && ./configure \
        --enable-ssl \
        --enable-inet6 \
        --enable-ziplinks \
        --with-showlistmodes \
        --with-listen=5 \
        --with-dpath=/etc/unrealircd/ \
        --with-spath=/usr/bin/unrealircd \
        --with-nick-history=2000 \
        --with-sendq=3000000 \
        --with-bufferpool=18 \
        --with-permissions=0600 \
        --with-fd-setsize=1024 \
        --enable-dynamic-linking &&
        make &&
        make install &&
        mkdir -p /usr/lib64/unrealircd/modules &&
        mv /etc/unrealircd/modules/* /usr/lib64/unrealircd/modules/

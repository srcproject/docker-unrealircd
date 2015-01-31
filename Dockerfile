FROM srcproject/runit

MAINTAINER Unai Zalakain <contact@unaizalakain.info>


ENV BUILD_DIR /root
ENV UNREALIRCD_URL https://www.unrealircd.org/downloads/Unreal3.2.10.4.tar.gz
ENV UNREALIRCD_GPGKEY = 0x9FF03937


RUN mkdir -p $BUILD_DIR
WORKDIR $BUILD_DIR
ADD unreal.asc ${BUILD_DIR}/
ADD scripts/get.sh ${BUILD_DIR}/
ADD scripts/install.sh ${BUILD_DIR}/
RUN chmod u+x ${BUILD_DIR}/get.sh
RUN chmod u+x ${BUILD_DIR}/install.sh

RUN ${BUILD_DIR}/get.sh
RUN ${BUILD_DIR}/install.sh

EXPOSE 6697
EXPOSE 7000

# Execute UnrealIRCd using runit
RUN mkdir /etc/service/unrealircd && echo '#!/bin/sh\n\
exec /usr/bin/unrealircd -F' > /etc/service/unrealircd/run
RUN chown root.root /etc/service/unrealircd/run
RUN chmod 750 /etc/service/unrealircd/run

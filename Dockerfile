FROM debian:buster-slim

ENV GAME_VERSION=0.3.2
ENV GAME_PORT=11753
ENV UID=99
ENV GID=100
ENV USER="openrct2"
ENV BASE_DIR="/openrct2"
ENV SERVER_DIR="${BASE_DIR}/server"
ENV DATA_DIR="${BASE_DIR}/data"
ENV ORG_GAME_DIR="${BASE_DIR}/game"

RUN apt-get update && \
	apt-get -y install --no-install-recommends \
		curl libjansson4 libzip4 libpng-tools libicu63 \
		libfreetype6 libfontconfig libsdl2-2.0-0 \
		libspeexdsp-dev libduktape203 && \
	apt-get -y install --reinstall ca-certificates && \
	cd /usr/lib/x86_64-linux-gnu && \
	ln -s libduktape.so.203 libduktape.so.202

# https://github.com/OpenRCT2/OpenRCT2/issues/7937
COPY /lib/libicudata.so.60 /usr/lib/x86_64-linux-gnu/libicudata.so.60
COPY /lib/libicuuc.so.60 /usr/lib/x86_64-linux-gnu/libicuuc.so.60

###
# COPY OpenRCT2-0.3.2-linux-x86_64.tar.gz /openrct2/server/
###

RUN mkdir -p $SERVER_DIR $DATA_DIR $ORG_GAME_DIR/rct1 $ORG_GAME_DIR/rct2 && \
	useradd -d $BASE_DIR $USER && \
	chown -R $USER $BASE_DIR

ADD /scripts/ /opt/scripts/
RUN chmod +x /opt/scripts/*.sh && \
	usermod -u $UID $USER && \
	usermod -g $GID $USER && \
	chown -R $UID:$GID /opt/scripts && \
	chown -R $UID:$GID $BASE_DIR

VOLUME ["$DATA_DIR", "$ORG_GAME_DIR/rct2", "$ORG_GAME_DIR/rct1"]

ENTRYPOINT ["/opt/scripts/entry-point.sh"]

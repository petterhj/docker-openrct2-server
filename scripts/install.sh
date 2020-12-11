#!/bin/bash

GAME_FILENAME="OpenRCT2-${GAME_VERSION}-linux-x86_64.tar.gz"
GAME_DOWNLOAD_URL="https://github.com/OpenRCT2/OpenRCT2/releases/download/v${GAME_VERSION}/${GAME_FILENAME}"

cd ${SERVER_DIR}

if [ ! -s ${GAME_FILENAME} ]; then
    echo "Downloading openrct2:${GAME_VERSION} from ${GAME_DOWNLOAD_URL}"
    curl -sL ${GAME_DOWNLOAD_URL} -O ${GAME_FILENAME} 
fi

echo "Unpacking..."
tar -xzf ${GAME_FILENAME}
mv ${SERVER_DIR}/OpenRCT2/* ${SERVER_DIR}
rm -r ${SERVER_DIR}/OpenRCT2
rm ${SERVER_DIR}/${GAME_FILENAME}

#!/bin/bash

echo "=-=-=-=-=-=-=-=- OpenRCT2 =-=-=-=-=-=-=-=-"
echo "VERSION:      ${GAME_VERSION}"
echo "USER:         ${USER}"
echo "UID:          ${UID}"
echo "GID:          ${GID}"
echo "SERVER DIR:   ${SERVER_DIR}"
echo "DATA DIR:     ${DATA_DIR}"
echo "GAME DIR:     ${ORG_GAME_DIR}"
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"

su -s /bin/bash -c "/opt/scripts/install.sh && /opt/scripts/start.sh" ${USER}

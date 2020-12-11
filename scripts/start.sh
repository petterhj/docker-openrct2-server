#!/bin/bash

echo "Starting server with config: ${GAME_CONFIG}"

cd ${SERVER_DIR}

${SERVER_DIR}/openrct2-cli host ${DATA_DIR}/save/save.sv6 \
	--rct2-data-path=${ORG_GAME_DIR}/rct2 \
	--rct1-data-path=${ORG_GAME_DIR}/rct1 \
	--user-data-path=${DATA_DIR} \
	--port ${GAME_PORT} \
	--verbose \
	${GAME_CONFIG}

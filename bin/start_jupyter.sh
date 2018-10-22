#!/bin/bash

: ${JUPYTER_ARGS:="${JUPYTER_ARGS}"}
: ${JUPYTER_NOTEBOOK_DIR:="/notebooks"}
: ${JUPYTER_BASE_URL:="/"}

JUPYTER_ARGS="--allow-root --ip 0.0.0.0 --notebook-dir ${JUPYTER_NOTEBOOK_DIR} --NotebookApp.base_url=${JUPYTER_BASE_URL}"
if [[ "X$JUPYTER_WEBSOCKET_URL" != "X" ]];then
  JUPYTER_ARGS="${JUPYTER_ARGS} --NotebookApp.websocket_url=${JUPYTER_WEBSOCKET_URL}"
fi
if [[ "X$JUPYTER_API_TOKEN" != "X" ]];then
  JUPYTER_ARGS="${JUPYTER_ARGS} --NotebookApp.token=${JUPYTER_API_TOKEN}"
fi

echo ">> jupyter notebook ${JUPYTER_ARGS}  $@"
jupyter notebook ${JUPYTER_ARGS}  $@

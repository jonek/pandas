#!/bin/bash

if [[ -z ${PORT+x} ]]; then
    PORT=8080
fi
if [[ -z ${CONTAINER_NAME+x} ]]; then
    CONTAINER_NAME=pandas
fi
if [[ -z ${DATA_DIR+x} ]]; then
    DATA_DIR=$(pwd)/data
fi
if [[ -z ${NOTEBOOK_DIR+x} ]]; then
    NOTEBOOK_DIR=$(pwd)/example
    NOTEBOOK=ExampleNotebook.ipynb
else
    NOTEBOOK=""
fi

docker run --detach \
    --publish ${PORT}:8888 \
    --volume ${DATA_DIR}:/data \
    --volume ${NOTEBOOK_DIR}:/notebooks \
    --name ${CONTAINER_NAME} \
    pandas start-notebook.sh --notebook-dir=/notebooks --notebookApp.token=12345

echo; echo -n "."; sleep 1; echo -n "."; sleep 1; echo -n ". "

TOKEN=$(docker logs ${CONTAINER_NAME} 2>&1 | grep "?token=" | cut -d "=" -f 2 | uniq)
URL=http://localhost:${PORT}/notebooks/${NOTEBOOK}?token=${TOKEN}

echo "opening URL in browser:"
echo "${URL}"

xdg-open "${URL}"

#!/bin/bash

LOCAL_PORT=8080
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
    --publish ${LOCAL_PORT}:8888 \
    --volume ${DATA_DIR}:/data \
    --volume ${NOTEBOOK_DIR}:/notebooks \
    --name pandas \
    pandas start-notebook.sh --notebook-dir=/notebooks --notebookApp.token=12345

echo; echo -n "."; sleep 1; echo -n "."; sleep 1; echo -n ". "

TOKEN=$(docker logs pandas 2>&1 | grep "?token=" | cut -d "=" -f 2 | uniq)
URL=http://localhost:${LOCAL_PORT}/notebooks/${NOTEBOOK}?token=${TOKEN}

echo "opening URL in browser:"
echo "${URL}"

xdg-open ${URL}

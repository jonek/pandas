#!/bin/bash

LOCAL_PORT=8080

docker run --detach \
    --publish ${LOCAL_PORT}:8888 \
    --volume $(pwd)/data:/data \
    --volume $(pwd)/example:/example \
    --name pandas \
    pandas start-notebook.sh --notebook-dir=/example --notebookApp.token=12345

echo; echo -n "."; sleep 1; echo -n "."; sleep 1; echo -n ". "

TOKEN=$(docker logs pandas 2>&1 | grep "?token=" | cut -d "=" -f 2 | uniq)
URL=http://localhost:${LOCAL_PORT}/notebooks/ExampleNotebook.ipynb?token=${TOKEN}

echo "opening URL in browser:"
echo "${URL}"

xdg-open ${URL}

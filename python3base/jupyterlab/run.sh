
docker run -p 8888:8888 \
    -v ${PWD}/work:/work \
    -e PASSWORD=123 \
    --rm -it one/jupyterlab /bin/bash

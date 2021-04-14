docker run -p 8888:8888 \
    -v ${PWD}/work:/work \
    -e PASSWORD=123 \
    -e LANG=C.UTF-8 -e LC_ALL=C.UTF-8 \
    --rm -it one/py2neo /bin/bash

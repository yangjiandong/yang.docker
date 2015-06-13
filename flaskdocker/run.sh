#! /bin/bash

docker run -it -v ~/workspace/docker/yang.docker/flaskdocker:/code -p 5000:5000 flaskdocker_flask /bin/bash
# docker run --rm -i -t yangjiandong/flask /bin/bash
# docker run --rm -i -t yangjiandong/flask /bin/bash

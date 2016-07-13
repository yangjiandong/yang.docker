#! /bin/bash

docker run -it -v ~/workspace/openresty/openresty-test:/app -p 6699:6699 yangjiandong/openresty /bin/bash


#! /bin/bash

docker run -it --rm --volumes-from=mysql yangjiandong/mysql:5.5 mysql -uroot -p123

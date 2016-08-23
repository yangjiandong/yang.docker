#! /bin/bash

docker run -it --rm --volumes-from=mysql yangjiandong/mysql:5.6 mysql -uroot -p

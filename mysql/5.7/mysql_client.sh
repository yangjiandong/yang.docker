#! /bin/bash

docker run -it --rm --volumes-from=mysql5.7 one/mysql:5.7 mysql -uroot

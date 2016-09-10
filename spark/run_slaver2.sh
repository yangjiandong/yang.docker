docker run --name spark-slaver2 -it \
    -v ~/data/conf:/mconf \
    -v ~/data/log22:/usr/local/hadoop/logs \
    -v ~/data/spark_log22:/usr/local/spark/logs \
    -h spark-slaver2 \
    --privileged \
    yangjiandong/spark:1.6.0 bash


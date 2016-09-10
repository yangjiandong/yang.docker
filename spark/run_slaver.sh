docker run --name spark-slaver1 -it \
    -v ~/data/conf:/mconf \
    -v ~/data/log2:/usr/local/hadoop/logs \
    -v ~/data/spark_log2:/usr/local/spark/logs \
    -h spark-slaver1 \
    --privileged \
    yangjiandong/spark:1.6.0 bash


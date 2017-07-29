# sysbench ./sysbench/oltp_common.lua \
# --mysql-host=192.168.1.109 --mysql-port=3306 --mysql-user=root --mysql-password=123 \
# --mysql-db=dbtest  \
# --tables=500000 \
# --report-interval=10 \
# --tables=10 \
# --table-size=1000000 \
# --time=120 --threads=12 \
# run
# # [prepare|run|cleanup]

sysbench ./sysbench/update_index.lua \
--tables=10 --table_size=100000 \
--mysql-host=127.0.0.1 \
--mysql-port=3336 \
--mysql-user=root \
--mysql-password=123 \
--mysql-db=dbtest  \
--threads=20 \
--time=120 \
run
# 
# >> sysbench_oltpx.log

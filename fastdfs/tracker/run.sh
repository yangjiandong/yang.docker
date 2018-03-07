docker run -d --name tracker \
    -v $(pwd)/data/fastdfs/tracker:/data/tracker \
    -p 22122:22122 \
    one/fdfs_tracker
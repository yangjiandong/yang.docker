docker run -d --name storage \
    -v $(pwd)/data/fastdfs/storage:/data/storage \
    --link tracker:tracker \
    -p 80:80 \
    -e TRACKER=tracker \
    one/fdfs_storage

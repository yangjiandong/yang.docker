docker run \
    --name mongo \
    -d \
    -e MONGO_INITDB_ROOT_USERNAME=admin \
    -e MONGO_INITDB_ROOT_PASSWORD=123 \
    -v $(pwd)/data:/data/db \
    -p 27017:27017 \
    mongo:3.6.6
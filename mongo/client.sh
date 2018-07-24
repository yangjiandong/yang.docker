docker run \
    -it --rm \
    --link mongo:mongo \
    mongo:3.6.6 \
    mongo --host mongo -u admin -p 123 --authenticationDatabase admin some-db
    
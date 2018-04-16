
docker run \
    -d \
    --name postgresql8 \
    -v $(pwd)/data:/var/lib/postgresql/data \
    -p 5432:5432 \
    -e POSTGRES_PASSWORD=123 \
    one/postgresql:8.4 


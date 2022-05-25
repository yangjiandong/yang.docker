docker run \
    -d \
    --name pg13 \
    -v $(pwd)/data/postgres:/data/postgres \
    -p 5439:5432 \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=123 \
    -e PGDATA="/data/postgres" \
    -e POSTGRES_MULTIPLE_DATABASES=demo,tooljet \
    --privileged=true \
    postgres:13


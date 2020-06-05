
docker run \
    -d \
    --name postgresql9 \
    -v $(pwd)/scripts:/docker-entrypoint-initdb.d \
    -v $(pwd)/data:/var/lib/postgresql/data/ \
    -p 5432:5432 \
    -e POSTGRES_USER=root \
    -e POSTGRES_PASSWORD=123 \
    -e POSTGRES_MULTIPLE_DATABASES=jira_db,jira_test_db \
    postgres:9.6.17 


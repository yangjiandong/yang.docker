# first start mysql5.7
docker run -itd --name stock-app  \
    -v $(pwd)/data/notebooks:/data/notebooks \
    -v $(pwd)/supervisor:/data/supervisor \
    -v $(pwd)/jobs:/data/jobs \
    -p 8888:8888 \
    -p 9999:9999 \
    pythonstock/pythonstock:latest

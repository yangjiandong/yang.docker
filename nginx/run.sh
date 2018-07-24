# 
    
docker run \
    --name nginx \
    -p 8888:80 \
    -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf:ro \
    -v $(pwd)/logs:/var/log/nginx \
    -d nginx:1.14
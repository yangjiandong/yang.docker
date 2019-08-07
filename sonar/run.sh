docker run -d --name sonarqube \
    -p 9000:9000 \
    --privileged=true \
    -v $(pwd)/my/conf:/opt/sonarqube/conf \
    -v $(pwd)/my/data:/opt/sonarqube/data \
    -v $(pwd)/my/logs:/opt/sonarqube/logs \
    -v $(pwd)/my/extensions:/opt/sonarqube/extensions \
    sonarqube:lts

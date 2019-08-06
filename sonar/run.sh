docker run -d --name sonarqube \
    -p 9000:9000 \
    -v ./my/conf:/opt/sonarqube/conf \
    -v ./my/data:/opt/sonarqube/data \
    -v ./my/logs:/opt/sonarqube/logs \
    -v ./my/extensions:/opt/sonarqube/extensions \
    sonarqube:lts

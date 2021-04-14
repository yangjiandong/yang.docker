docker run -it --rm \
  -p 8885:5000 \
  -v ${PWD}/work:/app \
  one/flask \
  /bin/ash

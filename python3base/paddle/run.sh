
docker run -p 8888:8888 \
    --name jub -d \
    --privileged \
    -v ${PWD}/work:/work \
    -e PASSWORD=123 \
    -e LANG=C.UTF-8 -e LC_ALL=C.UTF-8 \
    one/paddle:1.7.2 sh /work/run_jupyter.sh

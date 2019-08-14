
docker run -p 8888:8888 \
    --name jub -d \
    -v ${PWD}/work:/work \
    -e PASSWORD=123 \
    -e LANG=C.UTF-8 -e LC_ALL=C.UTF-8 \
    one/py3base:3.6.6 sh /work/run_jupyter.sh

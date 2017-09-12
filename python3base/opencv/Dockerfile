FROM yangjiandong/py3base:v2

# COPY pip.conf ~/.pip/pip.conf
# PYPI repository location
ARG pypi_url=https://mirrors.aliyun.com/
# PYPI index location
ARG pypi_index_url=https://mirrors.aliyun.com/pypi/simple

RUN mkdir ~/.pip && \
    echo "[global]" > ~/.pip/pip.conf && \
    echo "index = $pypi_url" >> ~/.pip/pip.conf && \
    echo "index-url = $pypi_index_url" >> ~/.pip/pip.conf && \
    echo "trusted-host = $(echo $pypi_url | perl -pe 's|^.*?://(.*?)(:.*?)?/.*$|$1|')" >> ~/.pip/pip.conf


RUN pip3 install numpy matplotlib

# RUN wget https://github.com/Itseez/opencv/archive/3.2.0.zip && unzip 3.2.0.zip \
    # && mv opencv-3.2.0 /opencv

# opencv
# ENV OPENCV_INSTALL=3.2.0.zip
COPY 3.2.0.zip ./

RUN unzip 3.2.0.zip \
    && mv opencv-3.2.0 /opencv

RUN mkdir /opencv/release
WORKDIR /opencv/release

RUN cmake -DBUILD_TIFF=ON \
        -DBUILD_opencv_java=OFF \
        -DWITH_CUDA=OFF \
        -DENABLE_AVX=ON \
        -DWITH_OPENGL=ON \
        -DWITH_OPENCL=ON \
        -DWITH_IPP=OFF \
        -DWITH_TBB=ON \
        -DWITH_EIGEN=ON \
        -DWITH_V4L=ON \
        -DWITH_VTK=OFF \
        -DBUILD_TESTS=OFF \
        -DBUILD_PERF_TESTS=OFF \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DBUILD_opencv_python2=OFF \
        -DCMAKE_INSTALL_PREFIX=$(python3 -c "import sys; print(sys.prefix)") \
        -DPYTHON3_EXECUTABLE=$(which python3) \
        -DPYTHON3_INCLUDE_DIR=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
        -DPYTHON3_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") ..

RUN make -j4
RUN make install

#RUN rm -rf /opencv 

RUN pip3 install ipython

WORKDIR /work

CMD ["bash"]
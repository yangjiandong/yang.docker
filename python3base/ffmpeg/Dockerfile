FROM yangjiandong/py3base:v2

MAINTAINER yangjiandong <59338947@qq.com>

ENV NUM_CORES 4

WORKDIR /usr/local/src

RUN git clone --depth 1 https://github.com/l-smash/l-smash 
RUN git clone --depth 1 git://git.videolan.org/x264.git 
RUN hg clone https://bitbucket.org/multicoreware/x265 
RUN git clone --depth 1 git://source.ffmpeg.org/ffmpeg 
RUN git clone --depth 1 git://github.com/mstorsjo/fdk-aac.git 

# RUN git clone --depth 1 https://chromium.googlesource.com/webm/libvpx 
RUN git clone --depth 1 https://github.com/webmproject/libvpx.git
RUN git clone https://git.xiph.org/opus.git 
RUN git clone --depth 1 https://github.com/mulx/aacgain.git 
                  

# Build L-SMASH
# =================================
WORKDIR /usr/local/src/l-smash
RUN ./configure \
    && make -j ${NUM_CORES} \
    && make install
# =================================


# Build libx264
# =================================
WORKDIR /usr/local/src/x264
RUN ./configure --enable-static \
    && make -j ${NUM_CORES} \
    && make install
# =================================


# Build libx265
# =================================
WORKDIR  /usr/local/src/x265/build/linux
RUN cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DENABLE_SHARED:bool=off ../../source \
    && make -j ${NUM_CORES} \
    && make install
# =================================

# Build libfdk-aac
# =================================
WORKDIR /usr/local/src/fdk-aac
RUN autoreconf -fiv \
    && ./configure --disable-shared \
    && make -j ${NUM_CORES} \
    && make install
# =================================

# Build libvpx
# =================================
WORKDIR /usr/local/src/libvpx
RUN ./configure --disable-examples \
    && make -j ${NUM_CORES} \
    && make install
# =================================

# Build libopus
# =================================
WORKDIR /usr/local/src/opus
RUN ./autogen.sh \
    && ./configure --disable-shared \
    && make -j ${NUM_CORES} \
    && make install
# =================================


# Build ffmpeg.
# =================================

# NOTE: Disableling libx265 for now
#       as it no longer compiles
#            --enable-libx265 \
#
WORKDIR /usr/local/src/ffmpeg
RUN ./configure --extra-libs="-ldl" \
            --enable-gpl \
            --enable-libass \
            --enable-libfdk-aac \
            --enable-libfontconfig \
            --enable-libfreetype \
            --enable-libfribidi \
            --enable-libmp3lame \
            --enable-libopus \
            --enable-libtheora \
            --enable-libvorbis \
            --enable-libvpx \
            --enable-libx264 \
            --enable-nonfree \
            --enable-openssl \
    && make -j ${NUM_CORES} \
    && make install
# =================================

# Remove all tmpfile and cleanup
# =================================
WORKDIR /usr/local/
RUN rm -rf /usr/local/src
RUN apt-get autoremove -y; apt-get clean -y
# =================================

# moviepy

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

ENV NUMPY_VERSION 1.10.4
# Pillow 3 is not compatible with MoviePy
# https://github.com/Zulko/moviepy/issues/241
ENV PILLOW_VERSION 2.8.1
ENV SCIPY_VERSION 0.17.0

# Install moviepy and related packages
# ====================================
RUN pip install -U numpy==$NUMPY_VERSION
RUN pip install -U Pillow==$PILLOW_VERSION
RUN pip install -U scipy==$SCIPY_VERSION
#RUN pip install -U moviepy==$MOVIEPY_VERSION

ENV FFMPEG_BINARY ffmpeg
ENV IMAGEMAGICK_BINARY convert
# Manually build version that allows control of FFMPEG exe
# See https://github.com/Zulko/moviepy/issues/237
# Use PIP when issue fixed. For now, change the defaults
# manually
RUN pip install tqdm

WORKDIR /usr/local/src
RUN git clone -q https://github.com/Zulko/moviepy.git
WORKDIR /usr/local/src/moviepy
#ADD config_defaults.py moviepy/config_defaults.py
RUN sudo python setup.py install

# Remove all tmpfile and cleanup
# =================================
WORKDIR /usr/local/
RUN rm -rf /usr/local/src
# =================================

# Setup a working directory to allow for
# docker run --rm -ti -v ${PWD}:/code ...
# =======================================
WORKDIR /work

#EOP

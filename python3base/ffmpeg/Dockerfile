FROM yangjiandong/py3base:v2

MAINTAINER yangjiandong <59338947@qq.com>

ENV NUM_CORES 4

WORKDIR /usr/local/src

RUN apt-get update -qq && apt-get install -y --force-yes \
    git \
    mercurial \
    # 用完包管理器后安排打扫卫生可以显著的减少镜像大小
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

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

#EOP

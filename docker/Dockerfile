FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        cython \
        ffmpeg \
        git \
	python-dev \
	python-pip \
        python-setuptools \
        wget \
        # libboost-all-dev \
        unzip

ADD requirements.txt /tmp
RUN pip install pip --upgrade && \
    pip install -r /tmp/requirements.txt
# RUN rm -rf /var/lib/apt/lists/*

# Installing opencv
RUN cd /opt && \
      wget https://github.com/Itseez/opencv/archive/3.1.0.zip -O opencv-3.1.0.zip -nv && \
      unzip opencv-3.1.0.zip && \
      cd opencv-3.1.0 && \
      rm -rf build && \
      mkdir build && \
      cd build && \
      cmake -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=/usr/local \
        -D WITH_CUDA=OFF \
        -D BUILD_NEW_PYTHON_SUPPORT=ON .. && \
      make -j6 && \
      make install

RUN echo "/usr/local/lib" | tee -a /etc/ld.so.conf.d/opencv.conf && \
      ldconfig

RUN mkdir /diffs
RUN mkdir /opt/work
WORKDIR /opt/work

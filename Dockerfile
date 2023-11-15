# syntax=docker/dockerfile:1

# ADF v2.5
# IDF v4.4.4

ARG IDF=release-v5.0
FROM espressif/idf:$IDF
ARG ADF=v2.6
ENV ADF_PATH=/opt/esp/adf

RUN git clone https://github.com/espressif/esp-adf.git \
  -b $ADF                                              \
  --depth 1                                            \
  $ADF_PATH

RUN cd $ADF_PATH && git -c submodule."esp-idf".update=none submodule update --init --recursive

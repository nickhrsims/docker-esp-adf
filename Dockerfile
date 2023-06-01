# syntax=docker/dockerfile:1

FROM nickhrsims/development-base:ubuntu-22.04

RUN apt-get update
RUN apt-get install -y \
    gcc                \
    cmake              \
    libusb-1.0-0       \
    &&                 \
    apt-get clean

ENV ADF_PATH=/opt/esp-adf
ENV IDF_PATH=$ADF_PATH/esp-idf
ENV ESP_ADF_BRANCH=release/v2.4

RUN git clone https://github.com/espressif/esp-adf.git \
        --depth 1            \
        --recurse-submodules \
        --shallow-submodules \
        -b $ESP_ADF_BRANCH   \
        $ADF_PATH

USER developer
RUN $IDF_PATH/install.sh
RUN echo 'export ADF_PATH=/opt/esp-adf' >> $HOME/.zshenv
RUN echo 'export IDF_PATH=$ADF_PATH/esp-idf' >> $HOME/.zshenv
RUN echo 'source $IDF_PATH/export.sh' >> $HOME/.zshrc
RUN git config --global --add safe.directory /opt/esp-adf/esp-idf

USER root
WORKDIR $HOME

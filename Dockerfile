# syntax=docker/dockerfile:1

# ADF v2.5
# IDF v4.4.4

FROM espressif/idf:v4.4.4
ENV ADF_PATH=/opt/esp/adf

ENV ESP_ADF_BRANCH=v2.5
RUN git clone https://github.com/espressif/esp-adf.git \
        -b $ESP_ADF_BRANCH   \
        --depth 1            \
        $ADF_PATH

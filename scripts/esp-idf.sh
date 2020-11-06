#!/bin/sh

# path
ESP_HOME=$HOME/.esp
IDF_DIR=$ESP_HOME/esp-idf
ESPRESSIF_DIR=$ESP_HOME/espressif

# esp-idf
REPOSITORY=https://github.com/espressif/esp-idf.git
TAG=v4.0.1

function setup() {
    mkdir -p $ESP_HOME
    if [[ -d $IDF_DIR ]]; then
        echo -n "ESP-IDF is already downloaded. Redo it? [y/N]: "
        read -r -n 1 -s ans
        if [[ $ans = [Yy] ]]; then
            rm -rf $IDF_DIR
        else
            return 0
        fi
    fi
    git clone --recursive $REPOSITORY -b $TAG $IDF_DIR
}

function install() {
    cd $IDF_DIR
    if ! pyenv local esp-idf ;then
        echo "Virtualenv: esp-idf is not found"
        return 1
    fi
    pip install --upgrade pip
    pip install -r requirements.txt
    pip install virtualenv
    export IDF_TOOLS_PATH=$ESPRESSIF_DIR
    ./install.sh
}

setup
install

#!/bin/bash

cd ~
mkdir -s git
cd git
git clone https://github.com/mikenye/docker-youtube-dl.git
cd docker-youtube-dl.git
docker build -t youtube-dl .


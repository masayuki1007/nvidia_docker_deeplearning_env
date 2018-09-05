#FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04
FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

LABEL maintainer="nvidia-docker-deeplearning"

# update
RUN apt-get update

# install utilities
RUN apt-get install -y sudo git zsh openssh-server wget gcc libatlas-base-dev

# userの追加
RUN groupadd -g 1000 developer

# user:ubuntu, password:ubuntu
RUN useradd -g developer -G sudo -m -s /bin/bash ubuntu
RUN echo "ubuntu:ubuntu" | chpasswd

# 日本語対応
RUN apt-get install locales locales-all
RUN export LANG=en_US.UTF-8

# 以下は user:ubuntu での操作
USER ubuntu
WORKDIR /home/ubuntu/

# docker build のディレクトリにあるファイル (.) を, カレントディレクトリ (`./`) にコピー
ADD . ./

# pyenv
RUN git clone git://github.com/yyuu/pyenv.git .pyenv
ENV HOME /home/ubuntu
ENV PYENV_ROOT ${HOME}/.pyenv
ENV PATH ${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${PATH}

RUN pyenv install anaconda3-5.1.0
RUN pyenv rehash
RUN pyenv install anaconda2-5.1.0
RUN pyenv rehash
RUN pyenv global anaconda3-5.1.0

# jupyter font setting
RUN mkdir .jupyter
RUN mkdir .jupyter/custom
RUN echo ".CodeMirror pre, .output pre { font-family: Ricty; font-size: 12pt; }" > .jupyter/custom/custom.css

# keras
RUN pip install keras tensorflow-gpu

# chainer
RUN pip install chainer

# PyTorch for cuda8
RUN pip install torchvision

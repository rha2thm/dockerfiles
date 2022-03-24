FROM pytorch/pytorch:1.10.0-cuda11.3-cudnn8-runtime

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
      gcc \
      curl \
      zsh \
      tree \
      git \
      python3-opencv \
      software-properties-common

RUN add-apt-repository ppa:neovim-ppa/stable
RUN apt update && apt install -y neovim

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN chsh -s /usr/bin/zsh

RUN curl -sLf https://spacevim.org/install.sh | bash

COPY requirements.txt /tmp
RUN pip install --upgrade pip
RUN pip install -r /tmp/requirements.txt

EXPOSE 22
EXPOSE 8080
EXPOSE 6006
EXPOSE 8000
EXPOSE 8888
WORKDIR /workspace

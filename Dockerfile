FROM pytorch/pytorch:1.10.0-cuda11.3-cudnn8-runtime

RUN apt update && apt install -y \
      gcc \
      curl \
      zsh \
      neovim \
      tree \
      git

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN chsh -s 'whcih zsh'

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

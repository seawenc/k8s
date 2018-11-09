FROM ubuntu:14.04
RUN apt-get install -y wget
RUN wget https://storage.googleapis.com/harbor-releases/harbor-offline-installer-v1.6.1.tgz

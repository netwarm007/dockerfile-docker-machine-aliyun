FROM tim03/go
MAINTAINER Chen, Wenli <chenwenli@chenwenli.com>

RUN \
 curl -L https://github.com/docker/machine/releases/download/v0.9.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine && \
  chmod +x /tmp/docker-machine && \
  cp /tmp/docker-machine /usr/local/bin/docker-machine

RUN \
 mkdir /root/go && cd /root/go && \
 export GOPATH=/root/go && \
 go get github.com/denverdino/docker-machine-driver-aliyunecs && \
 go install github.com/denverdino/docker-machine-driver-aliyunecs && \
 export PATH=$GOPATH/bin:$PATH

ENTRYPOINT docker-machine create -d aliyunecs "$@"

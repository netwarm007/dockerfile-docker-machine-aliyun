FROM tim03/go
LABEL maintainer Chen, Wenli <chenwenli@chenwenli.com>

RUN \
 curl -L https://github.com/docker/machine/releases/download/v0.12.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine && \
  chmod +x /tmp/docker-machine && \
  cp /tmp/docker-machine /usr/local/bin/docker-machine && \
  mkdir -p /root/.docker/machine

RUN \
 cd $GOPATH && \
 go get -d github.com/denverdino/docker-machine-driver-aliyunecs && \
 go install github.com/denverdino/docker-machine-driver-aliyunecs 

COPY ./entry_point.sh /

ENTRYPOINT ["/entry_point.sh"]
CMD ["--help"]

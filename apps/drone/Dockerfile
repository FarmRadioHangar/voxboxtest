FROM resin/raspberrypi-golang:1.6


ENV GOPATH /go

ENV GO15VENDOREXPERIMENT 1

RUN git clone git://github.com/drone/drone.git $GOPATH/src/github.com/drone/drone \
 && cd $GOPATH/src/github.com/drone/drone \
 && make deps \
 && make gen \
 && make build_static

ENTRYPOINT ['$GOPATH/bin/drone']
CMD ["server"]

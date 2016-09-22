FROM resin/raspberrypi3-golang:1.6


ENV GOPATH /go

# Let's start with some basic stuff.
RUN apt-get update && apt-get install -y \
    libudev-dev\
  && rm -rf /var/lib/apt/lists/*

RUN go get  -v github.com/FarmRadioHangar/fessboxconfig


WORKDIR $GOPATH/github.com/FarmRadioHangar/fessboxconfig

RUN go build -o fconf

 RUN  cp ./fconf /usr/bin \
 && mkdir /etc/fconf \
 && cp ./etc/fconf.json /etc/fconf/fconf.json

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["fconf","-c","/etc/fconf/fconf.json"]


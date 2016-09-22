FROM resin/raspberrypi3-debian

ENV GOPATH /go

COPY ./fconf /usr/bin \

RUN mkdir /etc/fconf \
 && cp ./fconf.json /etc/fconf/fconf.json

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["fconf","-c","/etc/fconf/fconf.json"]


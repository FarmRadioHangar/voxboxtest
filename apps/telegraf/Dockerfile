COPY entrypoint.sh /entrypoint.sh
FROM resin/raspberrypi-golang:1.6


ENV GOPATH /go

ENV GO15VENDOREXPERIMENT 1

RUN git clone git://github.com/influxdata/telegraf.git $GOPATH/src/github.com/influxdata/telegraf \
 && cd $GOPATH/src/github.com/influxdata/telegraf \
 && go get -v\
 && go install ./cmd/telegraf

ENTRYPOINT ["/entrypoint.sh"]
CMD ["$GOPATH/bin/telegraf"]

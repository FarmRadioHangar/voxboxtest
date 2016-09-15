
FROM resin/raspberrypi-golang:1.6


ENV GOPATH /go

RUN  go get -v github.com/influxdata/telegraf \
 && cd $GOPATH/src/github.com/influxdata/telegraf \
 && make build

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["$GOPATH/bin/telegraf"]

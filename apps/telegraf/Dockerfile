
FROM resin/raspberrypi-golang:1.6


ENV GOPATH /go

ENV TELEGRAF_SOURCE github.com/influxdata/telegraf

RUN  go get github.com/influxdata/telegraf\
 && cd $GOPATH/src/github.com/influxdata/telegraf\
 && make

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["$GOPATH/bin/telegraf"]

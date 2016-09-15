
FROM resin/raspberrypi-golang:1.6


ENV GOPATH /go

ENV TELEGRAF_SOURCE github.com/influxdata/telegraf

RUN  go get $TELEGRAF_SOURCE  \
 && cd $GOPATH/src/$TELEGRAF_SOURCE \
 && make

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["$GOPATH/bin/telegraf"]

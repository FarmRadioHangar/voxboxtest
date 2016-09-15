FROM resin/raspberrypi3-debian

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl

RUN curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add - \
 && source /etc/os-release \
 && test $VERSION_ID = "7" && echo "deb https://repos.influxdata.com/debian wheezy stable" | sudo tee /etc/apt/sources.list.d/influxdb.list \
 && test $VERSION_ID = "8" && echo "deb https://repos.influxdata.com/debian jessie stable" | sudo tee /etc/apt/sources.list.d/influxdb.list

RUN apt-get update && sudo apt-get install telegraf

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]

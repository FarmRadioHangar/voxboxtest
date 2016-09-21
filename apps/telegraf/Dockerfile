FROM resin/raspberrypi3-debian

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    wget\
    lxc \
    iptables
ENV TELEGRAF telegraf_1.0.0_armhf.deb

RUN  wget https://dl.influxdata.com/telegraf/releases/$TELEGRAF \
&& dpkg -i $TELEGRAF


EXPOSE 8125/udp 8092/udp 8094

COPY ./telegraf.conf /etc/telegraf/telegraf.conf

COPY entrypoint.sh /entrypoint.sh

RUN chmod u+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]


FROM resin/raspberrypi3-debian

COPY ./fconf /usr/bin

COPY ./fconf.json /etc/fconf/fconf.json


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["fconf","-c","/etc/fconf/fconf.json"]


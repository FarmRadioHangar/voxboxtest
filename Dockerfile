FROM resin/raspberrypi3-debian
MAINTAINER justin@dray.be

ENV INITSYSTEM on

# Let's start with some basic stuff.
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables
    
# Install Docker from hypriot repos
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 37BBEE3F7AD95B3F && \
    echo "deb https://packagecloud.io/Hypriot/Schatzkiste/debian/ wheezy main" > /etc/apt/sources.list.d/hypriot.list && \
    apt-get update && \
    apt-get install -y docker-hypriot docker-compose

COPY ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

COPY ./apps /apps

COPY ./voxbox.service /etc/systemd/system/voxbox.servic

# Define additional metadata for our image.
VOLUME /var/lib/docker
RUN systemd enable wrapdocker.service
RUN systemd enable voxbox.service

CMD [“/usr/sbin/init”]


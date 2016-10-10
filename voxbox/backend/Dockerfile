FROM resin/raspberrypi3-node:onbuild
# install redis
RUN apt-get update\
  && apt-get install build-essential tcl

WORKDIR /tmp
RUN curl -O http://download.redis.io/redis-stable.tar.gz \
  && tar xzvf redis-stable.tar.gz

WORKDIR /tmp/redis-stable
RUN make
RUN make install
RUN mkdir /etc/redis
COPY ./etc/redis.conf /etc/redis
RUN adduser --system --group --no-create-home redis \
  && mkdir /var/lib/redis \
  && chown redis:redis /var/lib/redis 
WORKDIR /usr/src/app
EXPOSE 19998

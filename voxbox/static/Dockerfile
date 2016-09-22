FROM resin/armhf-alpine

RUN apk add --update ruby

COPY ./public /public

WORKDIR /public
CMD /usr/bin/ruby -run -ehttpd . -p80

FROM  resin/raspberrypi3-debian
MAINTAINER Geofrey Ernest <gernest@farmradio.org>

ENV ASTERISKUSER pbxrunner
RUN groupadd -r $ASTERISKUSER \
  && usermod -aG $ASTERISKUSER $USER

# grab gosu for easy step-down from root
RUN apt-get update && apt-get install -y \
	git \
	uuid-dev \
	build-essential \
	libxml2-dev \
	libncurses5-dev \
	libsqlite3-dev \
	libssl-dev \
	libxslt-dev \
	libjansson-dev\
	php5 \
	php5-json \
	php5-curl\
	sox \
	mpg123 \
	libwww-perl\
	wget\
	&& rm -rf /var/lib/apt/lists/*


WORKDIR /tmp
# Get pj project
RUN git clone -b pjproject-2.4.5 --depth 1 https://github.com/asterisk/pjproject.git

# Build pj project
WORKDIR /tmp/pjproject
RUN ./configure
RUN make dep
RUN make
RUN make install
RUN ldconfig


# get asterisk
WORKDIR /tmp
RUN git clone -b certified/13.8 --depth 1 https://gerrit.asterisk.org/asterisk

#installation asterisk
WORKDIR /tmp/asterisk
RUN  ./configure
RUN  cd menuselect && make menuselect && cd .. & make menuselect-tree
RUN  menuselect/menuselect --disable BUILD_NATIVE menuselect/menuselect.makeopts 
RUN  make && make install && make config


WORKDIR /tmp
# Install files for asterisk
RUN  wget http://sourceforge.net/projects/phpagi/files/latest/download \
	&& tar xvzf download \
	&& mv phpagi-2.20/* /var/lib/asterisk/agi-bin/  \
 	&& chmod ugo+x /var/lib/asterisk/agi-bin/*.php\
	&& rm -f download

#Expose outside volumes
VOLUME /var/log/asterisk
VOLUME /etc/asterisk
VOLUME /var/lib/asterisk

WORKDIR /

#Copy minimum configuration files so that it can start
COPY etc/* /etc/asterisk/

#Start Asterisk in foreground
CMD ["asterisk","-f"]

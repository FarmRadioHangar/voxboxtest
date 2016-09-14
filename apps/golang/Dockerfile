FROM resin/raspberrypi3-debian


# Install dependencies
RUN apt-get update && apt-get install -y \
    ca-certificates \
    gcc \
	curl\
    libc6-dev \
    make \
    git \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Compile Go from source
ENV GOROOT_BOOTSTRAP /goroot
ENV GOLANG_DOWNLOAD_URL http://dave.cheney.net/paste/go1.5.3.linux-arm.tar.gz
ENV GOLANG_DOWNLOAD_SHA256 91351355746af99659366d12dc85de11e8d14522

RUN curl -fsSL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz \
	&& echo "$GOLANG_DOWNLOAD_SHA256  golang.tar.gz" | sha256sum -c - \
	&& tar -C $GOROOT_BOOTSTRAP -xzf golang.tar.gz \
	&& rm golang.tar.gz

ENV GOLANG_VERSION 1.7

RUN \
    mkdir -p /goroot1.7 && \
    git clone https://go.googlesource.com/go /goroot1.7 && \
    cd /goroot1.7 && \
    git checkout go$GOLANG_VERSION && \
    cd /goroot1.7/src && \
    GOARM=6 ./all.bash

# Set environment variables
ENV GOROOT /goroot1.7
ENV GOPATH /go
ENV GOARM 7
ENV PATH $GOROOT/bin:$GOPATH/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH

# Define working directory
WORKDIR $GOPATH

CMD ["bash"]

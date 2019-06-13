FROM alpine:3.9
MAINTAINER Jesper Jeeninga <jeeninga@gmail.com>
RUN \
	apk update && \
	apk add tzdata && \ 
	apk add git build-base autoconf pcre openssl-dev zlib-dev && \
	cp -r -f /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime && \
	cd /tmp && \
	git clone https://github.com/pennmush/pennmush.git && \
	cd /tmp/pennmush && \
	./configure --disable-nls --disable-info_slave && \
	make update && \
	make install && \
	cp -rL /tmp/pennmush/game /tmp/artifacts || : && \
	chown -R 1000:1000 /tmp/artifacts && \
	rm -rf /tmp/pennmush && \
	apk del git build-base autoconf pcre openssl-dev zlib-dev --purge && \ 
	rm -rf /var/cache/apk/*
VOLUME [ "/tmp/volume" ] 
ENTRYPOINT [ "cp", "-rp", "/tmp/artifacts/.", "/tmp/volume" ]

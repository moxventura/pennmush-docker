FROM alpine:3.9
MAINTAINER Jesper Jeeninga <jeeninga@gmail.com>
RUN \
	apk update && \
	apk add git tzdata && \ 
	apk add build-base autoconf pcre openssl-dev zlib-dev && \
	cp -r -f /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime && \
	adduser -g "pennmush user" -s /bin/sh -D pennmush && \
	su - pennmush && \
	git clone https://github.com/pennmush/pennmush.git && \
	cd pennmush && \
	./configure --disable-nls --disable-info_slave && \
	make update && \
	make install && \
	cp -rL game /home/pennmush/game || : && \
	rm -rf /home/pennmush/pennmush && \
	exit \
	apk del git tzdata build-base autoconf pcre openssl-dev zlib-dev --purge && \ 
	rm -rf /var/cache/apk/*
VOLUME [ "/home/pennmush/game" ]
USER pennmush
WORKDIR /home/pennmush/game
EXPOSE 4201
CMD [ "./restart.dst" ]

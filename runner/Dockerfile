FROM alpine:3.9
MAINTAINER Jesper Jeeninga <jeeninga@gmail.com>
RUN \
	apk update && \
	apk add tzdata make && \ 
	cp -r -f /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime && \
	adduser -g "pennmush user" -s /bin/sh -D pennmush -u 1000 && \
	su - pennmush && \
	mkdir /home/pennmush/game
ADD entrypoint.sh /home/pennmush/entrypoint.sh
RUN \
	chown -R pennmush:pennmush /home/pennmush && \
	chmod +x /home/pennmush/entrypoint.sh
VOLUME [ "/home/pennmush/game" ] 
USER pennmush
WORKDIR /home/pennmush/
EXPOSE 4201
ENTRYPOINT [ "/home/pennmush/entrypoint.sh" ]

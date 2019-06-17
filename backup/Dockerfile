FROM alpine:3.9
MAINTAINER Jesper Jeeninga <jeeninga@gmail.com>
RUN \
	apk update && \
	apk add tzdata && \ 
	cp -r -f /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime && \
  rm -rf /var/cache/apk/* && \
	mkdir -p /target
ADD crontab /etc/cron.d/pennmush
ADD pennback.sh /pennback.sh
ADD files.txt /files.txt
RUN \
	chmod 0644 /etc/cron.d/pennmush && \
	chmod +x ./pennback.sh && \
	/usr/bin/crontab /etc/cron.d/pennmush
VOLUME [ "/source" ] 
VOLUME [ "/target" ] 
ENTRYPOINT [ "/usr/sbin/crond", "-f" ]

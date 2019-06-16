FROM alpine:3.9
MAINTAINER Jesper Jeeninga <jeeninga@gmail.com>
RUN \
	apk update && \
	apk add tzdata make && \ 
	cp -r -f /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime && \
	adduser -g "pennmush user" -s /bin/sh -D pennmush -u 1000 && \
	su - pennmush && \
	mkdir /home/pennmush/game && \
	echo "cd /home/pennmush/game && ./restart && tail -F /home/pennmush/game/log/netmush.log" > /home/pennmush/entrypoint.sh && \
	chmod +x /home/pennmush/entrypoint.sh
ADD backup /home/pennmush/backup
RUN chown -R pennmush:pennmush /home/pennmush/backup
ADD crontab /etc/cron.d/pennback
VOLUME [ "/home/pennmush/game" ] 
USER pennmush
WORKDIR /home/pennmush/
EXPOSE 4201
ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "/home/pennmush/entrypoint.sh" ]

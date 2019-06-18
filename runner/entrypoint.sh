#!/usr/bin/env sh
# Save on exit
trap 'kill -SIGUSR2 `cat /home/pennmush/game/netmush.pid` && sleep 1 && kill -SIGINT `cat /home/pennmush/game/netmush.pid` && sleep 1 && rm /home/pennmush/game/netmush.pid; exit 0' SIGTERM
cd /home/pennmush/game
./restart
read

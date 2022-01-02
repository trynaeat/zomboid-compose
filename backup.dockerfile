FROM ubuntu:20.04
RUN apt-get update && apt-get -y install cron

WORKDIR /home
COPY backup.sh /home/backup.sh
COPY backup-cron /etc/cron.d/backup-cron

RUN chmod 0644 /etc/cron.d/backup-cron
RUN chmod a+x /home/backup.sh

RUN crontab /etc/cron.d/backup-cron

RUN touch /var/log/cron.log

CMD cron && tail -f /var/log/cron.log

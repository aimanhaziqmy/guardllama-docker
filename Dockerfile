FROM debian:bullseye

VOLUME [ "/tmp", "/run", "/run/lock" ]

RUN apt-get update && apt-get install -y systemd bash && apt-get clean && mkdir -p /lib/systemd && ln -s /lib/systemd/system /usr/lib/systemd/system;

WORKDIR /

RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
  /etc/systemd/system/*.wants/* \
  /lib/systemd/system/local-fs.target.wants/* \
  /lib/systemd/system/sockets.target.wants/*udev* \
  /lib/systemd/system/sockets.target.wants/*initctl* \
  /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* \
  /lib/systemd/system/systemd-update-utmp*

CMD [ "/lib/systemd/systemd" ]

EXPOSE 443
EXPOSE 80

RUN curl -sfL https://get.guardllama.net | sh -

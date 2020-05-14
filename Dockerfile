FROM alpine
MAINTAINER Amane Katagiri
EXPOSE 22
COPY extra_sshd_config /tmp/extra_sshd_config
RUN apk add --update --no-cache openssh \
  && ssh-keygen -A \
  && mkdir -p /host_keys \
  && find /etc/ssh/ -type f -name "ssh_host_*" | xargs -IXXX mv XXX /host_keys/ \
  && find /host_keys/ -type f | xargs -IXXX ln -s XXX /etc/ssh/ \
  && mkdir -p /data \
  && adduser -D -H sftp-user \
  && cat /tmp/extra_sshd_config >> /etc/ssh/sshd_config \
  && rm /tmp/extra_sshd_config
COPY run.sh /run.sh
CMD ["/run.sh"]

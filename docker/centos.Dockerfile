FROM centos:7

RUN \
  yum -y install openssh-clients openssh-server && \
  yum -y clean all && \
  touch /run/utmp && \
  chmod u+s /usr/bin/ping && \
  echo "root:root" | chpasswd

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
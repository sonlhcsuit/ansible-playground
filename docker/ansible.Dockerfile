FROM ubuntu:18.04

RUN apt update && apt install  openssh-server sudo -y

# RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 

RUN echo 'root:root' | chpasswd

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
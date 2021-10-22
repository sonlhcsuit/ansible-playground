FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-add-repository --yes --update ppa:ansible/ansible
RUN apt-get install -y ansible iputils-ping python-apt vim tree \
    curl

COPY id_rsa /root/
RUN cd /root && mkdir /root/.ssh/
RUN cp /root/id_rsa /root/.ssh/
RUN chmod 400 /root/.ssh/id_rsa
RUN chmod 400 /root/id_rsa

ENTRYPOINT ["tail", "-f", "/dev/null"]
FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-add-repository --yes --update ppa:ansible/ansible
RUN apt-get install -y ansible iputils-ping python-apt vim tree \
    curl

COPY ssh-key /root
RUN cd /root && mkdir /root/.ssh/
RUN cp /root/ssh-key /root/.ssh/
RUN chmod 400 /root/.ssh/ssh-key
RUN chmod 400 /root/ssh-key

ENTRYPOINT ["tail", "-f", "/dev/null"]
FROM rastasheep/ubuntu-sshd:18.04
COPY id_rsa.pub /root/.ssh/authorized_keys
COPY ./docker/ubuntu.entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
RUN chmod 400 /root/.ssh/authorized_keys
RUN apt-get install python3 -y
ENTRYPOINT [ "/entrypoint.sh" ]
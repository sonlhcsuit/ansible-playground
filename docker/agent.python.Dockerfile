FROM sickp/alpine-sshd:7.5
ENV PYTHONUNBUFFERED=1
RUN apk add --nocache openjdk8 make nss python3  
RUN ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN pip3 install virtualenv
COPY ssh-key.pub /root/.ssh/authorized_keys
RUN chmod 400 /root/.ssh/authorized_keys
FROM sickp/alpine-sshd:7.5
ENV PYTHONUNBUFFERED=1
RUN apk add make --no-cache
RUN apk add nss --no-cache 
RUN apk add python3 --no-cache 
RUN apk add openjdk8 --no-cache
RUN apk add git --no-cache 
RUN ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN pip3 install virtualenv
COPY id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 400 /root/.ssh/authorized_keys
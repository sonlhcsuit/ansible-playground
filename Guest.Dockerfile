FROM debian:stretch
# Install basic net tools
RUN apt-get update && \
    apt-get install -y openssh-server pwgen netcat net-tools curl wget && \
    apt-get clean all
# Install python and relevant tools (required by ansible)
RUN apt-get update && apt-get install -y \
        build-essential \
 python \
 python-dev \
 libxml2-dev \
 libxslt-dev \
 libssl-dev \
 zlib1g-dev \
 libyaml-dev \
 libffi-dev \
 python-pip
# Get latest versions of python tools via pip
RUN pip install --upgrade pip \
 virtualenv \
 requests
# Set localtime to
RUN ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
RUN mkdir /var/run/sshd
# SSH connected stuff
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
# Copy keys
RUN mkdir /root/.ssh
COPY opera_ubuntu.pub /root/.ssh/authorized_keys
RUN chmod 400 /root/.ssh/authorized_keys
# Expose port
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

# FROM alpine:3.6

# EXPOSE 22
# COPY alpine.entry.sh /

# RUN apk add --no-cache openssh \
#     && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
#     && echo "root:root" | chpasswd

# ENTRYPOINT [ "/alpine.entry.sh" ]
FROM sickp/
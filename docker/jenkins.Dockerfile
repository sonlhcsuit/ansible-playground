FROM jenkins/jenkins:lts-jdk11
USER root
RUN apt-get update -y && apt-get install sudo -y
RUN apt-get install python3 python3-pip -y
RUN pip3 install virtualenv 
COPY ./jk_home /var/jenkins_home

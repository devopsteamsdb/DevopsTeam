# Buils stage
FROM jenkins/jenkins:latest as build

USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Run stage
FROM build
RUN rm -rf /usr/share/jenkins/ref/plugins.txt

# Buils stage
FROM jenkins/jenkins:2.340 as build

USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

RUN git config --global http.sslVerify false

# Run stage
FROM build
RUN rm -rf /usr/share/jenkins/ref/plugins.txt

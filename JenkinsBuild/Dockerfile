# Buils stage
FROM jenkins/jenkins:2.340 as build

USER jenkins

COPY plugins_v2.txt /usr/share/jenkins/ref/

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins_v2.txt

RUN git config --global http.sslVerify false

# Run stage
FROM build
RUN rm -rf /usr/share/jenkins/ref/plugins_v2.txt

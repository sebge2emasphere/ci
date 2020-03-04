FROM jenkins/jenkins:2.204.4-jdk11

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY jenkins.yaml /usr/share/jenkins/ref/jenkins.yaml

# https://updates.jenkins.io/download/plugins/
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt


# client secret

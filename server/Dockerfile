ARG JENKINS_VERSION=2.225
ARG JENKINS_IMAGE_NAME=${JENKINS_VERSION}-jdk11

FROM openjdk:8-jdk-alpine AS jdk8
FROM openjdk:11.0.6-jdk-slim  AS jdk11

FROM jenkins/jenkins:$JENKINS_VERSION-jdk11 AS main

COPY --from=jdk8 /usr/lib/jvm/java-1.8-openjdk/ /usr/java/openjdk-8
COPY --from=jdk11 /usr/local/openjdk-11/ /usr/java/openjdk-11


RUN echo $JENKINS_VERSION > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
RUN echo $JENKINS_VERSION > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion

# https://updates.jenkins.io/download/plugins/
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY jenkins.yaml /usr/share/jenkins/ref/jenkins.yaml

ARG SONAR_VERSION=8.2-community

FROM alpine:3.7 AS base

RUN wget https://github.com/mc1arke/sonarqube-community-branch-plugin/releases/download/1.3.0/sonarqube-community-branch-plugin-1.3.0.jar -O /tmp/sonarqube-community-branch-plugin-1.3.0.jar


FROM sonarqube:$SONAR_VERSION AS main
ENV SONAR_HOME /opt/sonarqube

COPY --from=base /tmp/sonarqube-community-branch-plugin-1.3.0.jar ${SONAR_HOME}/extensions/plugins/
COPY --from=base /tmp/sonarqube-community-branch-plugin-1.3.0.jar ${SONAR_HOME}/lib/common/

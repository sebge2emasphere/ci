ARG SONAR_VERSION=8.2-community

FROM alpine:3.7 AS base

RUN wget https://github.com/mc1arke/sonarqube-community-branch-plugin/releases/download/1.3.0/sonarqube-community-branch-plugin-1.3.0.jar -O /tmp/sonarqube-community-branch-plugin-1.3.0.jar
RUN wget https://github.com/InfoSec812/sonar-auth-google/releases/download/1.6.1/sonar-auth-googleoauth-plugin-1.6.1.jar -O /tmp/sonar-auth-googleoauth-plugin-1.6.1.jar
RUN wget https://github.com/sebge2/sonar-config-as-code/releases/download/v0.0.1/sonar-as-code-linux-amd64 -O /usr/bin/sonar-as-code
RUN chmod ugo+x /usr/bin/sonar-as-code

FROM sonarqube:$SONAR_VERSION AS main
ENV SONAR_HOME /opt/sonarqube

COPY --from=base /tmp/sonarqube-community-branch-plugin-1.3.0.jar ${SONAR_HOME}/extensions/plugins/
COPY --from=base /tmp/sonarqube-community-branch-plugin-1.3.0.jar ${SONAR_HOME}/lib/common/
COPY --from=base /tmp/sonar-auth-googleoauth-plugin-1.6.1.jar ${SONAR_HOME}/extensions/plugins/
COPY --from=base /usr/bin/sonar-as-code /usr/bin/sonar-as-code

COPY files/sonar.yaml /shared/sonar.yaml

ARG SONAR_VERSION=8.2-community

FROM sonarqube:$SONAR_VERSION AS sonar

ENV SONAR_HOME /opt/sonarqube

ADD files/sonar.properties ${SONAR_HOME}/conf/sonar.properties

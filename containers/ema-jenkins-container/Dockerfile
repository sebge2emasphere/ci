FROM maven:3.6.3-jdk-8 AS mvn
FROM openjdk:8-jdk-alpine AS jdk8
FROM redis:4.0.14-alpine3.11 AS main

ENV JAVA_HOME=/usr/java/openjdk-8
ENV SENCHA_HOME=/usr/share/sencha
ENV MAVEN_HOME=/usr/share/maven

COPY --from=jdk8 /usr/lib/jvm/java-1.8-openjdk/ $JAVA_HOME
COPY --from=mvn /usr/share/maven/ $MAVEN_HOME


RUN mkdir $SENCHA_HOME
RUN wget https://static-emasphere-com.s3.eu-central-1.amazonaws.com/dev/ext-6.0.2.zip -O /tmp/ext.zip
RUN unzip /tmp/ext.zip -d $SENCHA_HOME && rm /tmp/ext.zip

RUN wget https://static-emasphere-com.s3.eu-central-1.amazonaws.com/dev/sencha-pivot.zip -O /tmp/sencha-pivot.zip
RUN unzip /tmp/sencha-pivot.zip -d $SENCHA_HOME && rm /tmp/sencha-pivot.zip

RUN wget https://static-emasphere-com.s3.eu-central-1.amazonaws.com/dev/sencha-exporter.zip -O /tmp/sencha-exporter.zip
RUN unzip /tmp/sencha-exporter.zip -d $SENCHA_HOME && rm /tmp/sencha-exporter.zip

RUN wget https://static-emasphere-com.s3.eu-central-1.amazonaws.com/dev/sencha-cmd.zip -O /tmp/sencha-cmd.zip
RUN unzip /tmp/sencha-cmd.zip -d $SENCHA_HOME && rm /tmp/sencha-cmd.zip


RUN apk add --no-cache libstdc++

RUN chmod ugo+x $SENCHA_HOME/bin/6.2.2.36/sencha
RUN chmod ugo+x $MAVEN_HOME/bin/mvn
RUN chmod ugo+x $JAVA_HOME/bin/*

ENV PATH=$SENCHA_HOME/bin/6.2.2.36/:$MAVEN_HOME/bin/:$JAVA_HOME/bin/:$PATH

ENTRYPOINT redis-server --daemonize yes && /bin/sh

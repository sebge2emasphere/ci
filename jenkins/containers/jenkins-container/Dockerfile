FROM maven:3.6.3-jdk-8 AS mvn
FROM openjdk:8-jdk-alpine AS main

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk/
ENV SENCHA_HOME=/usr/share/sencha
ENV MAVEN_HOME=/usr/share/maven

COPY --from=mvn /usr/share/maven/ $MAVEN_HOME


RUN mkdir $SENCHA_HOME
RUN wget https://static-emasphere-com.s3.eu-central-1.amazonaws.com/dev/ext-6.2.2.350-full.zip -O /tmp/ext.zip
RUN unzip /tmp/ext.zip -d $SENCHA_HOME && rm /tmp/ext.zip

RUN wget https://static-emasphere-com.s3.eu-central-1.amazonaws.com/dev/sencha-cmd.zip -O /tmp/sencha-cmd.zip
RUN unzip /tmp/sencha-cmd.zip -d $SENCHA_HOME && rm /tmp/sencha-cmd.zip

RUN apk --update add git less openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

RUN chmod ugo+x $SENCHA_HOME/bin/6.2.2.36/sencha
RUN chmod ugo+x $MAVEN_HOME/bin/mvn
RUN chmod ugo+x $JAVA_HOME/bin/*

ENV PATH=$SENCHA_HOME/bin/6.2.2.36/:$MAVEN_HOME/bin/:$JAVA_HOME/bin/:$PATH

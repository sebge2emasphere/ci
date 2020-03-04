FROM maven:3.6.3-jdk-8 AS mvn

FROM openjdk:8-jdk-alpine AS main

ENV SENCHA_HOME=/usr/share/sencha
ENV MAVEN_HOME=/usr/share/maven

COPY --from=mvn /usr/share/maven/ $MAVEN_HOME


RUN mkdir $SENCHA_HOME
RUN wget https://static-emasphere-com.s3.eu-central-1.amazonaws.com/dev/ext-6.0.2.zip -O ext.zip
RUN unzip ext.zip -d $SENCHA_HOME && rm ext.zip

RUN wget https://static-emasphere-com.s3.eu-central-1.amazonaws.com/dev/sencha-pivot.zip -O sencha-pivot.zip
RUN unzip sencha-pivot.zip -d $SENCHA_HOME && rm sencha-pivot.zip

RUN wget https://static-emasphere-com.s3.eu-central-1.amazonaws.com/dev/sencha-exporter.zip -O sencha-exporter.zip
RUN unzip sencha-exporter.zip -d $SENCHA_HOME && rm sencha-exporter.zip

RUN wget https://static-emasphere-com.s3.eu-central-1.amazonaws.com/dev/sencha-cmd.zip -O sencha-cmd.zip
RUN unzip sencha-cmd.zip -d $SENCHA_HOME && rm sencha-cmd.zip


RUN chmod ugo+x $SENCHA_HOME/bin/6.2.2.36/sencha
RUN chmod ugo+x /usr/share/maven/bin/mvn

ENV PATH=$SENCHA_HOME/bin/6.2.2.36/:$MAVEN_HOME/bin/:$PATH

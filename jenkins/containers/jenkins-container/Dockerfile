FROM maven:3.6.3-jdk-8 AS mvn
FROM openjdk:8-jdk-alpine AS main

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV SENCHA_HOME=/usr/share/sencha
ENV MAVEN_HOME=/usr/share/maven

COPY --from=mvn /usr/share/maven/ $MAVEN_HOME

RUN mkdir $SENCHA_HOME
RUN wget https://static-emasphere-com.s3.eu-central-1.amazonaws.com/dev/ext-6.2.2.350-full.zip -O /tmp/ext.zip
RUN unzip /tmp/ext.zip -d $SENCHA_HOME && rm /tmp/ext.zip

RUN wget https://static-emasphere-com.s3.eu-central-1.amazonaws.com/dev/sencha-cmd.zip -O /tmp/sencha-cmd.zip
RUN unzip /tmp/sencha-cmd.zip -d $SENCHA_HOME && rm /tmp/sencha-cmd.zip

RUN apk --update --no-cache add git less openssh bash fontconfig


ENV BUILD_EXTRA_PATH=$SENCHA_HOME/bin/:$MAVEN_HOME/bin/
ENV PATH=$PATH:$BUILD_EXTRA_PATH

# PhantomJS needed by Sencha
ENV PHANTOMJS_VERSION 2.1.1
RUN apk add --update --no-cache curl && \
    curl -Ls "https://github.com/dustinblackman/phantomized/releases/download/${PHANTOMJS_VERSION}/dockerized-phantomjs.tar.gz" | tar xz -C / && \
    curl -k -Ls https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2  | tar -jxvf - -C / && \
    cp phantomjs-${PHANTOMJS_VERSION}-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs && \
    rm -fR phantomjs-${PHANTOMJS_VERSION}-linux-x86_64 && \
    apk del curl
RUN ln -sf /usr/local/bin/phantomjs  /usr/share/sencha/bin/6.2.2.36/bin/linux-x64/phantomjs/phantomjs

RUN apk add rsync

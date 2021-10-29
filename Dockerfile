FROM openjdk:11

LABEL maintainer="quoc.phan@ericsson.com"

EXPOSE 8085/tcp

ARG PROJECT_DIR=msdemo
ARG PROJECT_BUILD_FINAL_NAME=msdemo-0.0.1-SNAPSHOT

RUN mkdir -p /opt/app/${PROJECT_DIR}/config

ADD ./build/libs/${PROJECT_BUILD_FINAL_NAME}.jar /opt/app/${PROJECT_DIR}/

WORKDIR /opt/app/${PROJECT_DIR}

ENV JAVA_OPTS ""
ENV JAR_FILE ${PROJECT_BUILD_FINAL_NAME}.jar

ENTRYPOINT ["/bin/sh", "-c", "exec java ${JAVA_OPTS} -Dhttps.protocols=TLSv1.2 -jar ${JAR_FILE} ${CLUSTER}"]

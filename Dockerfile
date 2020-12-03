FROM openjdk:8-alpine

# Required for starting application up.
RUN apk update && apk add /bin/sh

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY target/mediclaim-0.0.13-SNAPSHOT.war $PROJECT_HOME/mediclaim-0.0.13-SNAPSHOT.war

WORKDIR $PROJECT_HOME

CMD ["java" ,"-war","./mediclaim-0.0.13-SNAPSHOT.war"]

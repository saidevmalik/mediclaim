FROM tomcat:8.0
	MAINTAINER Digambar
	# COPY path-to-your-application-war path-to-webapps-in-docker-tomcat
	COPY /target/mediclaim-0.0.13-SNAPSHOT.war /usr/local/tomcat/webapps/
	
	
	
	
	
	
	#FROM openjdk:8-alpine
	
	# Required for starting application up.
	#RUN apk update && apk add /bin/sh
	
	#RUN mkdir -p /opt/app
	#ENV PROJECT_HOME /opt/app
	
	#COPY target/mediclaim-0.0.13-SNAPSHOT.jar $PROJECT_HOME/mediclaim-0.0.13-SNAPSHOT.jar
	
	#WORKDIR $PROJECT_HOME
	
	#CMD ["java" ,"-jar","./mediclaim-0.0.13-SNAPSHOT.jar"]


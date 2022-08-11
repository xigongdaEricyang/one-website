#
# Build stage
#
# FROM maven:3-jdk-8 AS build
# COPY src /home/app/src
# COPY pom.xml /home/app
# RUN mvn -f /home/app/pom.xml clean package -Dmaven.test.skip=true

#
# Package stage
#
FROM openjdk:8-alpine
RUN apk --update add --no-cache fontconfig ttf-dejavu
COPY one-website-0.0.1-SNAPSHOT.jar /usr/local/lib/one-website.jar
COPY src/main/resources/application.yml /usr/local/lib/application.yml

EXPOSE 8080
ENTRYPOINT ["java","-jar", "/usr/local/lib/one-website.jar","--spring.config.location=/usr/local/lib/application.yml"]
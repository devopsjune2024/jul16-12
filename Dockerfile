#FROM maven:3.9.8-amazoncorretto-17-al2023  as base
FROM docker.io/library/maven:3.9.8-amazoncorretto-17-al2023 as base
COPY . /app
WORKDIR /app
EXPOSE 8080
USER root
RUN mvn package

# #docker run -it maven:build bash
#FROM openjdk:17-alpine
FROM docker.io/library/openjdk:17-alpine
USER root
COPY --from=base /app/target/my-app-1.0-SNAPSHOT.jar /app/my-app-1.0-SNAPSHOT.jar
CMD java -jar /app/my-app-1.0-SNAPSHOT.jar

##docker run -it maven-jdk:build bin/sh

FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
COPY . .

RUN ./gradlew bootJar --no-daemon

FROM openjdk:17-jdk-slim

COPY build/libs/demo-1.jar ejercicio-saludo.jar

EXPOSE 9000

CMD ["java", "-jar", "ejercicio-saludo.jar"]
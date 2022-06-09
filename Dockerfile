FROM openjdk:11-jdk-slim
RUN apt update && apt install net-tools
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

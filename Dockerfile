FROM openjdk:11-jre-slim
EXPOSE 8080
RUN apt-get update && apt-get install -y \
curl
COPY target/Hello-*.jar SpringBootHelloApp.jar
CMD java ${JAVA_OPTS} -jar -Dspring.profiles.active=prod SpringBootHelloApp.jar
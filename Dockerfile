FROM ubuntu:latest

# Update package lists and install Java
RUN apt-get update && \
    apt-get install -y default-jdk && \
    apt-get clean

# Set the working directory
WORKDIR /app

VOLUME /tmp

# Copy your application into the container
ADD spring-boot-web-0.0.1-SNAPSHOT.jar /app/myapp.jar

RUN sh -c 'touch /app/myapp.jar'

# Set the entrypoint command
#ENTRYPOINT ["java", "-jar", "/app/myapp.jar"]
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app/myapp.jar"]

EXPOSE 8080

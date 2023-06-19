# Use the official OpenJDK image as the base image
FROM openjdk:11-jdk

# Install Maven
RUN apt-get update && apt-get install -y maven

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project file to the working directory
COPY pom.xml .

# Copy the source code to the working directory
COPY src ./src

RUN mvn clean package

RUN ls
RUN cd target
RUN ls

# Set the entry point for the container
ENTRYPOINT ["java", "-jar", "target/spring-boot-web-0.0.1-SNAPSHOT.jar.jar"]

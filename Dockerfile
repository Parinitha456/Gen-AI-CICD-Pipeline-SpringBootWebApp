# Use the official OpenJDK image as the base image
FROM openjdk:11-jdk

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project file to the working directory
COPY pom.xml .

# Copy the source code to the working directory
COPY src ./src

# Build the application with Maven
RUN ./mvnw package -DskipTests

# Set the entry point for the container
ENTRYPOINT ["java", "-jar", "target/*.jar"]

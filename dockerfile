# Use a base image with Java 17 and Maven installed
FROM maven:3.8.4-openjdk-17 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml file to the container
COPY pom.xml .

# Copy the source code to the container
COPY src ./src

# Build the application
RUN mvn clean package

# Use a lightweight base image with Java 17 installed
FROM adoptopenjdk/openjdk17:alpine-slim AS runtime

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the build stage to the runtime stage
COPY --from=build /app/target/publisher-0.0.1-SNAPSHOT.jar .

# Expose the port that your Spring Boot application listens on
EXPOSE 8888

# Specify the command to run your Spring Boot application
CMD ["java", "-jar", "publisher-0.0.1-SNAPSHOT.jar"]

# Use a lightweight Java runtime
FROM openjdk:8-jdk-alpine

# Copy the built JAR file into the container
COPY target/project-10-1.0-SNAPSHOT.jar app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]

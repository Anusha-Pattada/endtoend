# Use the official OpenJDK image from the Docker Hub
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the compiled Java file (assuming it's already compiled to HelloWorld.class)
COPY . /app


# Run the Java application
CMD ["java", "HelloWorld"]

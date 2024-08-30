# Use an official Maven image as a base
FROM maven:3.8.6-openjdk-11

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the Maven project files into the container
COPY pom.xml .
COPY src ./src

# Install SonarQube Scanner
RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.8.0.2856-linux.zip && \
    unzip sonar-scanner-cli-4.8.0.2856-linux.zip && \
    mv sonar-scanner-4.8.0.2856-linux /opt/sonar-scanner && \
    ln -s /opt/sonar-scanner/bin/sonar-scanner /usr/bin/sonar-scanner

# Set environment variables for SonarQube Scanner
ENV PATH="/opt/sonar-scanner/bin:${PATH}"

# Default command to run
CMD ["mvn", "clean", "verify"]

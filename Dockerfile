
FROM maven:3.8.6-openjdk-11


WORKDIR /usr/src/app


COPY pom.xml .
COPY src ./src


RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.8.0.2856-linux.zip && \
    unzip sonar-scanner-cli-4.8.0.2856-linux.zip && \
    mv sonar-scanner-4.8.0.2856-linux /opt/sonar-scanner && \
    ln -s /opt/sonar-scanner/bin/sonar-scanner /usr/bin/sonar-scanner


ENV PATH="/opt/sonar-scanner/bin:${PATH}"


CMD ["mvn", "clean", "verify"]

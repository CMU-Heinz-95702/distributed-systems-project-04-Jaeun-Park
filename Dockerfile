# Use official Tomcat with JDK 21
FROM tomcat:11.0.0-M24-jdk21-temurin-noble

# Limit Java memory usage
ENV JAVA_OPTS="-Xmx300m"

# Clean default webapps for a slimmer image
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your Spring Boot WAR into Tomcat's webapps directory
# You can rename it to ROOT.war if you want it at http://localhost:8080/
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

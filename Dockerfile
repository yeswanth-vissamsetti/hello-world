FROM tomcat:latest

# Clean default apps (optional but safe)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR as the default ROOT.war
COPY webapp/target/webapp.war /usr/local/tomcat/webapps/ROOT.war


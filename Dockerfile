# Use the official Jenkins LTS image
FROM jenkins/jenkins:lts

# Switch to the root user to install additional packages
USER root

# Install Docker (if needed within Jenkins container)
RUN apt-get update && apt-get install -y docker.io

# Switch back to the Jenkins user
USER jenkins

# Expose the port Jenkins is running on
EXPOSE 8080

# Set the default command to run Jenkins
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/usr/local/bin/jenkins.sh"]

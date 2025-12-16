# Start from the standard Jenkins image
FROM jenkins/jenkins:lts-jdk17

# Switch to root user to install software
USER root

# Install Docker CLI using cURL/apt (standard Linux install method)
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release \
  && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
  && apt-get update \
  && apt-get install -y docker-ce-cli \
  && apt-get update && apt-get install -y nano \
  && apt-get update && apt-get install -y vim
  

# Switch back to the jenkins user


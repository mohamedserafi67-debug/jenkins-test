FROM node:18-alpine

USER root

WORKDIR /var/jenkins_home/workspace/dockerimage 

COPY package.json .

RUN npm install

RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release \
  && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
  && apt-get update \
  && apt-get install -y docker-ce-cli \
  && apt-get update && apt-get install -y nano \
  && apt-get update && apt-get install -y vim

COPY . .

EXPOSE 4000

CMD ["npm", "run", "dev"]




# Auto-Implement

## Requirements

### Ansible requirement

- Replace EC2 DNS with your host DNS.
- Replace DNS instance with your instance DNS.

### Jenkins requirement

- Create credentials for DockerHub, GitHub, and SSH private key (key pair with EC2).
- Create multiple pipelines, add source by GitHub with access token in credentials, and choose the webhook option to trigger.

## Steps to Run

1. **Run ngrok on Port 8080 for Jenkins Webhook Trigger of GitHub**

   ```sh ngrok http 8080

   ```

2. **Build Jenkins Docker Image**

   ```docker build -t custom-jenkins -f Dockerfile.jenkins .

   ```

3. **Run Jenkins Container**
   ```docker run -it -p 8080:8080 -p 50000:50000 \
   -v /var/run/docker.sock:/var/run/docker.sock \
   -v jenkins_home:/var/jenkins_home \
   --name jenkins-container custom-jenkins
   ```

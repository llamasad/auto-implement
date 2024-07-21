
# Auto-Implementation Guide

## Requirements

### Ansible

- Replace the DNS instance in `inventory.ini` with your instance's DNS.

### Jenkins

- **Create Credentials**:
  - **DockerHub**: Create a DockerHub credential in Jenkins.
  - **GitHub**: Create a GitHub credential using an access token.
  - **SSH Private Key**: Create an SSH private key credential (for EC2 key pair).

- **Create Pipelines**:
  - Create a multiple pineline
  - Add source control from GitHub using the GitHub access token.
  - Choose the webhook option to trigger builds from GitHub commits.

## Steps to Run

### 1. Run ngrok for Jenkins Webhook Trigger

Expose Jenkins to the internet and allow GitHub to trigger builds:

```sh
ngrok http 8080
```

This will provide you with a public URL. Configure this URL in GitHub for webhooks.

### 2. Build Jenkins Docker Image

Create a custom Jenkins Docker image using the provided Dockerfile:

```sh
docker build -t custom-jenkins -f Dockerfile.jenkins .
```

### 3. Run Jenkins Container

Start the Jenkins container with the following command:

```sh
docker run -it -p 8080:8080 -p 50000:50000 \
   -v /var/run/docker.sock:/var/run/docker.sock \
   -v jenkins_home:/var/jenkins_home \
   --name jenkins-container custom-jenkins
```

- **`-p 8080:8080`**: Maps port 8080 of the container to port 8080 of the host (for Jenkins web interface).
- **`-p 50000:50000`**: Maps port 50000 of the container to port 50000 of the host (for Jenkins agent communication).
- **`-v /var/run/docker.sock:/var/run/docker.sock`**: Allows Jenkins to communicate with Docker on the host.
- **`-v jenkins_home:/var/jenkins_home`**: Mounts the Jenkins home directory for persistent storage.
- **`--name jenkins-container`**: Names the container for easy reference.

---

Feel free to adapt these instructions as needed for your specific setup and environment.


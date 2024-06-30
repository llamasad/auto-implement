#!/bin/bash

# Get the group ID of the Docker socket
DOCKER_GROUP_ID=$(stat -c '%g' /var/run/docker.sock)

# Create the Docker group with this group ID
groupadd -for -g $DOCKER_GROUP_ID docker

# Add the Jenkins user to the Docker group
usermod -aG docker jenkins

# Start Jenkins
exec gosu jenkins /usr/local/bin/jenkins.sh "$@"

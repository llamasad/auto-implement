# Use the official Jenkins LTS image as a base
FROM node:20.15.0-alpine3.20

# Set user and group IDs based on host system
ARG JENKINS_HOME_USER_ID=1000
ARG JENKINS_HOME_GROUP_ID=1000

# Install necessary packages
RUN apk add --no-cache shadow

# Create the jenkins group with matching IDs
RUN if getent group ${JENKINS_HOME_GROUP_ID} >/dev/null 2>&1; then \
      echo "Group exists"; \
    else \
      addgroup -g ${JENKINS_HOME_GROUP_ID} jenkins && echo "Group created"; \
    fi

# Create the jenkins user with matching IDs and add to the jenkins group
RUN if id -u ${JENKINS_HOME_USER_ID} >/dev/null 2>&1; then \
      echo "User exists"; \
    else \
      adduser -D -u ${JENKINS_HOME_USER_ID} -G jenkins -h /home/jenkins -s /bin/sh jenkins && echo "User created"; \
    fi

# Ensure Jenkins runs with the correct user
USER jenkins

# Define build-time arguments for user ID and group ID
ARG JENKINS_HOME_USER_ID
ARG JENKINS_HOME_GROUP_ID

# Use an appropriate base image
FROM node:20.15.0-alpine3.20

# Install necessary tools
RUN apk add --no-cache shadow

# Explicitly declare the build arguments as environment variables
ARG JENKINS_HOME_USER_ID
ARG JENKINS_HOME_GROUP_ID

# Use the build arguments to create the user and group
RUN addgroup -g ${JENKINS_HOME_GROUP_ID} jenkins && \
    adduser -D -u ${JENKINS_HOME_USER_ID} -G jenkins jenkins

# Set the user
USER jenkins
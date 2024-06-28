# Dockerfile
ARG JENKINS_HOME_USER_ID
ARG JENKINS_HOME_GROUP_ID

RUN groupadd -g $JENKINS_HOME_GROUP_ID jenkins && \
    useradd -m jenkins -u $JENKINS_HOME_USER_ID -g $JENKINS_HOME_GROUP_ID


# Run the container
docker run -t -d -u 1000:1000 \
    -v /home/datdo/.jenkins/workspace/My-Pipeline_main:/home/datdo/.jenkins/workspace/My-Pipeline_main:rw,z \
    -v /home/datdo/.jenkins/workspace/My-Pipeline_main@tmp:/home/datdo/.jenkins/workspace/My-Pipeline_main@tmp:rw,z \
    custom-jenkins cat

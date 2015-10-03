FROM phusion/baseimage:0.9.17
MAINTAINER @odk211

RUN apt-get update && \
  apt-get install -yq openjdk-7-jre && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl \
  --location \
  --output TaskRunner.jar \
  "https://s3.amazonaws.com/datapipeline-us-east-1/us-east-1/software/latest/TaskRunner/TaskRunner-1.0.jar"

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV AWS_ACCESS_KEY_ID **DefineMe**
ENV AWS_SECRET_ACCESS_KEY **DefineMe**
ENV TASKRUNNER_REGION ap-northeast-1
ENV TASKRUNNER_LOG_URI s3://logs
ENV TASKRUNNER_WORKERGROUP **DefineMe**

COPY src/ /

CMD ["/sbin/my_init"]


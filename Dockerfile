#
# Oracle Java 9 Dockerfile
#
# https://github.com/cogniteev/docker-oracle-java
# https://github.com/cogniteev/docker-oracle-java/tree/master/oracle-java9
#

# Pull base image.
FROM ubuntu:16.04

RUN sed -i -e s/archive.ubuntu.com/mirror.kku.ac.th/g /etc/apt/sources.list
# Install Java.
RUN \
  apt-get update && \
  apt-get install -y software-properties-common && \
  echo oracle-java11-installer shared/accepted-oracle-license-v1-2 select true | debconf-set-selections && \
  add-apt-repository -y ppa:linuxuprising/java && \
  apt-get update && \
  apt-get install -y oracle-java11-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk11-installer


# Define working directory.
WORKDIR /opt

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-11-oracle

# Define default command.
CMD ["bash"]

# Use Java 8 slim JRE
FROM openjdk:8-jre-slim
# open jdk dockerfile here: https://github.com/docker-library/openjdk/blob/86918ee28d383e7af63f535a2558040dce141099/8/jre/slim/Dockerfile
MAINTAINER screamingjoypad

# jmeter version in use
ARG JMETER_VERSION=3.3

# install untilities like wget, telnet and unzip
RUN apt-get clean && \
    apt-get update && \
    apt-get -qy install \
                wget \
                telnet \
                iputils-ping \
                unzip

# install jmeter
RUN   mkdir /jmeter \
      && cd /jmeter/ \
      && wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-3.3.tgz \
      && tar -xzf apache-jmeter-3.3.tgz \
      && rm apache-jmeter-3.3.tgz

# add plugins
#ADD jmeter-plugins/lib /jmeter/apache-jmeter-$JMETER_VERSION/lib

# Set JMeter Home
ENV JMETER_HOME /jmeter/apache-jmeter-3.3/

# Add JMeter to the Path
ENV PATH $JMETER_HOME/bin:$PATH
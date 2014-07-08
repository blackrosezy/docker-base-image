FROM ubuntu:14.04
MAINTAINER Rozi <blackrosezy@gmail.com>

# Install packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common \
                      build-essential wget curl make gcc git less unzip zip rpl \
                      python python-pip python-dev \
                      && apt-get update 

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

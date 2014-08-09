FROM ubuntu:14.04
MAINTAINER Rozi <blackrosezy@gmail.com>

# Prepare image
ADD prepare.sh /tmp/prepare.sh
RUN chmod +x /tmp/prepare.sh 
RUN /tmp/prepare.sh

# Install packages
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends software-properties-common \
    apt-transport-https ca-certificates build-essential wget curl make git less unzip zip rpl telnet htop \
    openssh-client python python-pip python-dev

# dcron, a lightweight cron daemon and can access environment variables
RUN curl -L https://github.com/dubiousjim/dcron/archive/v4.5.tar.gz -o /tmp/dcron.tar.gz
RUN tar xzvf /tmp/dcron.tar.gz -C /tmp && cd /tmp/dcron-* && make CRONTAB_GROUP=root && make install 
	
# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

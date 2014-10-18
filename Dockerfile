FROM ubuntu:12.04
MAINTAINER Shuddhashil Ray rayshuddhashil@gmail.com

#Ensuring UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

# Installing bunch of essentials
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update && apt-get -y install  build-essential curl \
																				  g++-multilib gcc-multilib openssl git git-core htop vim screen wget \
																					unzip openssh-server inetutils-ping sed telnet

# Install Java7u60
RUN mkdir -p /usr/lib/jvm
RUN (cd /usr/lib/jvm && wget  -q -nc --no-cookies \
					--no-check-certificate \
					--header "Cookie: oraclelicense=accept-securebackup-cookie" \
					http://download.oracle.com/otn-pub/java/jdk/7u60-b19/jdk-7u60-linux-x64.tar.gz)
RUN tar -xzvf /usr/lib/jvm/jdk-7u60-linux-x64.tar.gz -C /usr/lib/jvm
RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.7.0_60/bin/java 100
RUN update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.7.0_60/bin/javac 100
ENV JAVA_HOME			/usr/lib/jvm/jdk1.7.0_60
ENV JRE_HOME		  /usr/lib/jvm/jdk1.7.0_60/jre


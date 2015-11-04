# install OS
FROM ubuntu:latest
#FROM centos:centos7

# Author information
MAINTAINER Yoshitaro Takaesu <useakat@gmail.com>

ENV CHEFHOME /chef-repo
ADD chef-repo /chef-repo
ADD .bashrc /root/.bashrc
ADD .bash_profile /root/.bash_profile
ADD .bash_aliases /root/.bash_aliases

RUN mkdir /root/packages

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install curl
# #RUN yum -y update
# #RUN yum -y upgrade

# install Chef
RUN curl -L http://www.opscode.com/chef/install.sh | bash
# run Chef
RUN cd ${CHEFHOME} && chef-solo -c ${CHEFHOME}/solo.rb -j ${CHEFHOME}/nodes/docker.json
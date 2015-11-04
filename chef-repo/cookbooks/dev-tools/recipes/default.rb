# -*- coding: utf-8 -*-
#
# Cookbook Name:: dev-tools
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "dev-tools" do
  if platform_family?("debian")
    command <<-EOF
      apt-get -y install wget
      apt-get -y install git
      apt-get -y install build-essential
      apt-get -y install zlib1g-dev
      apt-get -y install cython
      apt-get -y install tclsh
      apt-get -y install python-pip
      pip install numpy
      apt-get -y install libXpm-dev
    EOF
  elsif platform_family?("rhel")
    command <<-EOF
      yum -y install wget
      yum -y install make
      yum -y install gcc gcc-c++
      yum -y install Cython
      yum -y install tcl
      yum -y install numpy
      yum -y install libSM
      yum -y install libX11
      yum -y install libXext
      yum -y install libXpm
      yum -y install libXft
      yum -y install git
    EOF
  end
end

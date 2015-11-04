# -*- coding: utf-8 -*-
#
# Cookbook Name:: root
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if platform?('ubuntu')
  if node['platform_version'].to_f >= 14 then
    execute "get_root_ubuntu14" do
      command <<-EOF
        wget https://root.cern.ch/download/root_v5.34.34.Linux-ubuntu14-x86_64-gcc4.8.tar.gz
        tar zxvf root_v5.34.34.Linux-ubuntu14-x86_64-gcc4.8.tar.gz -C /root/packages
      EOF
    end
  elsif node['platform_version'].to_f >= 12 then
    execute "get_root_ubuntu12" do
      command <<-EOF
        wget https://root.cern.ch/download/root_v5.34.34.Linux-ubuntu12-x86_64-gcc4.6.tar.gz
        tar zxvf root_v5.34.34.Linux-ubuntu12-x86_64-gcc4.6.tar.gz -C /root/packages
      EOF
    end
  end
elsif platform?('centos') && node['platform_version'].to_i == 7 then
  execute "get_root_centos7" do
    command <<-EOF
      wget https://root.cern.ch/download/root_v5.34.34.Linux-cc7-x86_64-gcc4.8.tar.gz
      tar zxvf root_v5.34.34.Linux-cc7-x86_64-gcc4.8.tar.gz -C /root/packages
      EOF
  end
end

execute "root_env" do
  command <<-EOF
    echo "# ROOT ENV" >> /root/.bashrc
    echo 'export ROOTSYS=$PACKAGES/root' >> /root/.bashrc
    echo 'export PATH=$ROOTSYS/bin:$PATH' >> /root/.bashrc
    echo 'export LD_LIBRARY_PATH=$ROOTSYS/lib:$LD_LIBRARY_PATH' >> /root/.bashrc
    echo 'export DISPLAY=localhost:0.0' >> /root/.bashrc
    source /root/.bashrc
    rm -rf root_v*
  EOF
end

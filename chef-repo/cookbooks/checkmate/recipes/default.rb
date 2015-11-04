#
# Cookbook Name:: checkmate
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "checkmate" do
#  if platform?("ubuntu")
    command <<-EOF
      wget http://www.hepforge.org/archive/checkmate/CheckMATE-1.2.2.tar.gz
      tar zxvf CheckMATE-1.2.2.tar.gz -C /root/packages
      cd /root/packages/CheckMATE-1.2.2
      ./configure --with-rootsys=/root/packages/root
      make
      rm -rf /CheckMATE-1.2.2.tar.gz
    EOF
#  end
end

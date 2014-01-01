#
# Cookbook Name:: toasty-rvm
# Recipe:: default
#
# Copyright 2014, Tyler Morgan
#
# All rights reserved - Do Not Redistribute
#

remote_file "#{Chef::Config[:file_cache_path]}/rvm-installer" do
  source "https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer"
  notifies :run, "execute[run rvm installer]", :immediately
end

execute "run rvm installer" do
  command "./#{Chef::Config[:file_cache_path]}/rvm-installer -s stable"
  notifies :run, "execute[update bash profile]", :immediately
end

execute "update bash profile" do
  command "source ~/.rvm/scripts/rvm"
  user 'toasty'
  notifies :run, "execute[install ruby 2.0]", :immediately
end

execute "install ruby 2.0" do
  command "rvm install 2.0.0"
  action :nothing
end




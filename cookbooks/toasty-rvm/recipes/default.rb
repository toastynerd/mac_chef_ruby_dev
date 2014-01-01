#
# Cookbook Name:: toasty-rvm
# Recipe:: default
#
# Copyright 2014, Tyler Morgan
#
# All rights reserved - Do Not Redistribute
#

execute "run rvm installer" do
  command "curl -sSL https://get.rvm.io | bash"
  user 'toasty'
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




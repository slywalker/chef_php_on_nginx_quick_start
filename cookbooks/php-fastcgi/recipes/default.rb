#
# Cookbook Name:: php-cgi
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "php5-cgi" do
  action :upgrade
end

template "/etc/default/php-fastcgi" do
  source "php-fastcgi.erb"
  owner "root"
  group "root"
  mode "0644"
end

cookbook_file "/etc/init.d/php-fastcgi" do
  source "php-fastcgi"
  owner "root"
  group "root"
  mode "0744"
end

service "php-fastcgi" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

cookbook_file "/etc/nginx/fastcgi_params" do
  source "fastcgi_params"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, resources(:service => "nginx")
end

template "#{node[:nginx][:dir]}/sites-available/default" do
  source "default-site.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources(:service => "nginx")
end

cookbook_file "/var/www/nginx-default/info.php" do
  source "info.php"
  owner "root"
  group "root"
  mode "0644"
end
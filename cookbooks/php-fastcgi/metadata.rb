maintainer       "YOUR_COMPANY_NAME"
maintainer_email "YOUR_EMAIL"
license          "All rights reserved"
description      "Installs/Configures fastcgi"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.5"

depends "build-essential"
depends "nginx"

%w{ debian ubuntu centos redhat fedora }.each do |os|
  supports os
end

attribute "php_fastcgi/host",
  :display_name => "FCGI_HOST",
  :description => "FCGI_HOST",
  :default => "127.0.0.1"

attribute "php_fastcgi/port",
  :display_name => "FCGI_PORT",
  :description => "FCGI_PORT",
  :default => "9000"

attribute "php_fastcgi/children",
  :display_name => "PHP_FCGI_CHILDREN",
  :description => "PHP_FCGI_CHILDREN",
  :default => "4"

attribute "php_fastcgi/max_requests",
  :display_name => "PHP_FCGI_MAX_REQUESTS",
  :description => "PHP_FCGI_MAX_REQUESTS",
  :default => "1000"
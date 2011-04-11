pack = value_for_platform([ "centos", "redhat", "fedora" ] => {"default" => "php-mbstring"}, "default" => "php5-mbstring")

if pack
  package pack do
    action :upgrade
  end
end
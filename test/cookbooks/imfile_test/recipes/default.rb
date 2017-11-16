#
# Cookbook:: imfile_test
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


imfile 'test imfile' do
  path '/srv/tomcat/logs/catalina.log'
  tag 'hostname_tomcat_catalina.log'
  ip 12341234
  port 1234
end

imfile 'test imfile' do
  path '/srv/somelog.log'
  tag 'tag'
  persist_state_interval 20
  ip 10
  port 11
end

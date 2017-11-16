# # encoding: utf-8

# Inspec test for recipe imfile::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/


describe file('/etc/rsyslog.d/srv_tomcat_logs_catalina_log.conf') do
  it { should exist }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its('mode') { should cmp '0644' }
  its('content') { should include '$InputFileName /srv/tomcat/logs/catalina.log'}
  its('content') { should include '$InputFileTag hostname_tomcat_catalina.log'}
  its('content') { should include '$InputFilePersistStateInterval 1000'}
  its('content') { should include '$InputRunFileMonitor'}
  its('content') { should include 'if $syslogtag == \'hostname_tomcat_catalina.log\' then @@12341234:1234'}
end

describe file('/etc/rsyslog.d/srv_somelog_log.conf') do
  it { should exist }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its('mode') { should cmp '0644' }
  its('content') { should include '$InputFileName /srv/somelog.log'}
  its('content') { should include '$InputFileTag tag'}
  its('content') { should include '$InputFilePersistStateInterval 20'}
  its('content') { should include '$InputRunFileMonitor'}
  its('content') { should include 'if $syslogtag == \'tag\' then @@10:11'}
end

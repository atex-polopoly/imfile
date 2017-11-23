# # encoding: utf-8

# Inspec test for recipe imfile::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/


describe file('/etc/rsyslog.d/_srv_tomcat_logs_file1_log.conf') do
  it { should exist }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its('mode') { should cmp '0644' }
  its('content') { should include '$InputFileName /srv/tomcat/logs/file1.log'}
  its('content') { should include '$InputFileTag file1.tag'}
  its('content') { should include '$InputFilePersistStateInterval 20'}
  its('content') { should include '$InputRunFileMonitor'}
  its('content') { should include 'if $syslogtag == \'file1.tag\' then @@10:11'}
end

describe file('/etc/rsyslog.d/_srv_tomcat_logs_file2_log.conf') do
  it { should exist }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its('mode') { should cmp '0644' }
  its('content') { should include '$InputFileName /srv/tomcat/logs/file2.log'}
  its('content') { should include '$InputFileTag file2.tag'}
  its('content') { should include '$InputFilePersistStateInterval 20'}
  its('content') { should include '$InputRunFileMonitor'}
  its('content') { should include 'if $syslogtag == \'file2.tag\' then @@10:11'}
end

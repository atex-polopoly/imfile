property :path, String, required: true, name_property: true
property :tag, String, required: true
property :persist_state_interval, Integer, default: 1000
property :ip, String, required: true
property :port, Integer, required: true

action :create do

  filename = path.gsub('/','_')
  filename = filename.gsub('.','_')

  resource = template "/etc/rsyslog.d/#{filename}.conf" do
    cookbook 'imfile'
    source 'imfile.erb'
    variables({
      path: new_resource.path,
      tag: new_resource.tag,
      ip: new_resource.ip,
      port: new_resource.port,
      persist_state_interval: new_resource.persist_state_interval
      })
    owner 'root'
    group 'root'
    mode '0644'
  end

  ruby_block 'set restart for rsyslog' do
    block do
      node['restart']['rsyslog'] = ''
    end
  end
    only_if { resource.updated_by_last_action? }
  end

end

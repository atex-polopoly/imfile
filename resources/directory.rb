property :tag, String, required: true, name_property: true
property :persist_state_interval, Integer, default: 1000
property :ip, String, required: true
property :port, Integer, required: true
property :files, Array, required: true

action :create do

  new_resource.files.each do |file|
    filename = file.split('/').last
    filename = filename.split('.').first
    imfile file do
      path file
      tag "#{filename}.#{new_resource.tag}"
      persist_state_interval new_resource.persist_state_interval
      ip new_resource.ip
      port new_resource.port
    end
  end
end

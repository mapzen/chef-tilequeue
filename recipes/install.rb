#
# Cookbook Name:: tilequeue
# Recipe:: install
#

# generate a pip requirements file for consistent python package
# versions
# alternatively, we could host the requirements file somewhere, eg s3,
# and install from there
template node[:tilequeue][:pip_requirements] do
  source 'tilequeue-pip-requirements.txt.erb'
end

# install python packages from requirements file
python_pip "-r #{node[:tilequeue][:pip_requirements]}"

# create config files needed for tilequeue
tilequeue_config_file_template_mapping = {
  'config.yaml' => 'tilequeue-config.yaml.erb',
  'logging.conf' => 'tilequeue-logging.conf.erb'
}
tilequeue_config_file_template_mapping.each do |filename, templatename|
  template "#{node[:tilequeue][:cfg_path]}/#{filename}" do
    source templatename
  end
end

include_recipe 'tilequeue::runit' if node[:tilequeue][:init_type] == 'runit'

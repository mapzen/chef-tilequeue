#
# Cookbook Name:: tilequeue
# Attributes:: default
#

default[:tilequeue][:cfg_path] = '/etc/tilequeue'
default[:tilequeue][:cfg_file] = 'config.yaml'

# for yaml configuration file
default[:tilequeue][:aws][:sqs][:name] = ''
default[:tilequeue][:aws][:s3][:bucket] = ''
default[:tilequeue][:aws][:s3][:path] = ''
default[:tilequeue][:aws][:credentials][:aws_access_key_id] = ''
default[:tilequeue][:aws][:credentials][:aws_secret_access_key] = ''
default[:tilequeue][:tiles][:metro_extract][:zoom_filter] = 10
default[:tilequeue][:tiles][:zoom_start] = 0
default[:tilequeue][:tiles][:zoom_until] = 15
default[:tilequeue][:tiles][:expired] = ''
default[:tilequeue][:tilestache][:config] = "#{default[:tilestache][:cfg_path]}/#{default[:tilestache][:cfg_file]}"
default[:tilequeue][:tilestache][:formats] = ['json', 'vtm']
default[:tilequeue][:logging][:config] = "#{default[:tilequeue][:cfg_path]}/logging.conf"
default[:tilequeue][:pip_requirements] = "#{Chef::Config[:file_cache_path]}/pip-requirements.txt"

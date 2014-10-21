#
# Cookbook Name:: tilequeue
# Attributes:: default
#

default[:tilequeue][:cfg_path]                                  = '/etc/tilequeue'
default[:tilequeue][:cfg_file]                                  = 'config.yaml'
default[:tilequeue][:pip_requirements]                          = "#{Chef::Config[:file_cache_path]}/pip-requirements.txt"

# common configuration with tilestache
default[:tilequeue][:tilestache][:user]                         = node[:tilestache][:user]      || 'tilestache'
default[:tilequeue][:tilestache][:group]                        = node[:tilestache][:group]     || 'tilestache'
default[:tilequeue][:tilestache][:cfg_path]                     = node[:tilestache][:cfg_path]  || '/etc/tilestache'
default[:tilequeue][:tilestache][:cfg_file]                     = node[:tilestache][:cfg_file]  || 'tilestache.conf'

# for yaml configuration file
default[:tilequeue][:aws][:sqs][:name]                          = ''
default[:tilequeue][:aws][:s3][:bucket]                         = ''
default[:tilequeue][:aws][:s3][:path]                           = ''
default[:tilequeue][:aws][:credentials][:aws_access_key_id]     = ''
default[:tilequeue][:aws][:credentials][:aws_secret_access_key] = ''

default[:tilequeue][:tiles][:metro_extract][:zoom_filter]       = 10
default[:tilequeue][:tiles][:zoom_start]                        = 0
default[:tilequeue][:tiles][:zoom_until]                        = 15
default[:tilequeue][:tiles][:expired]                           = ''

default[:tilequeue][:tilestache][:config]                       = "#{default[:tilequeue][:tilestache][:cfg_path]}/#{default[:tilequeue][:tilestache][:cfg_file]}"
default[:tilequeue][:tilestache][:formats]                      = %w(json vtm)

default[:tilequeue][:logging][:config]                          = "#{default[:tilequeue][:cfg_path]}/logging.conf"

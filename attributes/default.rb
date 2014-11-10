#
# Cookbook Name:: tilequeue
# Attributes:: default
#

default[:tilequeue][:cfg_path]                                  = '/etc/tilequeue'
default[:tilequeue][:cfg_file]                                  = 'config.yaml'
default[:tilequeue][:bin_path]                                  = '/usr/local/bin/tilequeue'

default[:tilequeue][:install_method]                            = 'pip_requirements'
default[:tilequeue][:pip_requirements_location]                 = "#{Chef::Config[:file_cache_path]}/tilequeue-pip-requirements.txt"
default[:tilequeue][:pip_requirements][:argparse]               = 'argparse==1.2.1'
default[:tilequeue][:pip_requirements][:boto]                   = 'boto==2.33.0'
default[:tilequeue][:pip_requirements][:modestmaps]             = 'ModestMaps==1.4.6'
default[:tilequeue][:pip_requirements][:pillow]                 = 'Pillow==2.6.1'
default[:tilequeue][:pip_requirements][:protobuf]               = 'protobuf==2.6.0'
default[:tilequeue][:pip_requirements][:psycopg2]               = 'psycopg2==2.5.4'
default[:tilequeue][:pip_requirements][:pyyaml]                 = 'PyYAML==3.11'
default[:tilequeue][:pip_requirements][:shapely]                = 'Shapely==1.4.3'
default[:tilequeue][:pip_requirements][:simplejson]             = 'simplejson==3.6.4'
default[:tilequeue][:pip_requirements][:tilequeue]              = 'git+https://github.com/mapzen/tilequeue#egg=tilequeue'
default[:tilequeue][:pip_requirements][:tilestache]             = 'git+https://github.com/mapzen/TileStache@integration-1#egg=TileStache'
default[:tilequeue][:pip_requirements][:werkzeug]               = 'Werkzeug==0.9.6'
default[:tilequeue][:pip_requirements][:wsgiref]                = 'wsgiref==0.1.2'

#default[:tilequeue][:install_method]                            = 'source'
default[:tilequeue][:source][:install_dir]                      = '/opt/tilequeue'
default[:tilequeue][:source][:repo]                             = 'https://github.com/mapzen/tilequeue.git'
default[:tilequeue][:source][:version]                          = 'master'

# common configuration with tilestache
default[:tilequeue][:tilestache][:user]                         = node[:tilestache][:user]      || 'tilestache'
default[:tilequeue][:tilestache][:group]                        = node[:tilestache][:group]     || 'tilestache'
default[:tilequeue][:tilestache][:cfg_path]                     = node[:tilestache][:cfg_path]  || '/etc/tilestache'
default[:tilequeue][:tilestache][:cfg_file]                     = node[:tilestache][:cfg_file]  || 'tilestache.conf'

default[:tilestache][:install_method]                           = 'pip_requirements'

# tilequeue user to create
default[:tilequeue][:user][:user]                               = 'tilequeue'
default[:tilequeue][:user][:create]                             = true

# for yaml configuration file
default[:tilequeue][:aws][:sqs][:name]                          = ''
default[:tilequeue][:aws][:s3][:bucket]                         = ''
default[:tilequeue][:aws][:s3][:path]                           = ''
default[:tilequeue][:aws][:credentials][:aws_access_key_id]     = ''
default[:tilequeue][:aws][:credentials][:aws_secret_access_key] = ''

default[:tilequeue][:tiles][:metro_extract][:zoom_filter]       = 11
default[:tilequeue][:tiles][:zoom_start]                        = 0
default[:tilequeue][:tiles][:zoom_until]                        = 15
default[:tilequeue][:tiles][:expired]                           = '/tmp/expired.list'

default[:tilequeue][:tilestache][:config]                       = "#{default[:tilequeue][:tilestache][:cfg_path]}/#{default[:tilequeue][:tilestache][:cfg_file]}"
default[:tilequeue][:tilestache][:formats]                      = %w(json vtm)

default[:tilequeue][:logging][:config]                          = "#{default[:tilequeue][:cfg_path]}/logging.conf"

default[:tilequeue][:tilediff][:redis][:host]                   = 'localhost'
default[:tilequeue][:tilediff][:redis][:port]                   = 6379
default[:tilequeue][:tilediff][:redis][:db]                     = 0
default[:tilequeue][:tilediff][:redis][:cache_set_key]          = 'tilestache.cache'

default[:tilequeue][:tilediff][:intersect][:expired]            = '/tmp/expired-intersected.list'
default[:tilequeue][:tilediff][:intersect][:script][:path]      = '/usr/local/bin/tilequeue-tilediff.sh'
default[:tilequeue][:tilediff][:intersect][:script][:output]    = '/tmp/tilequeue-tilediff-output.log'

default[:tilequeue][:tilediff][:cron][:enabled]                 = true
default[:tilequeue][:tilediff][:cron][:minute]                  = '0'
default[:tilequeue][:tilediff][:cron][:hour]                    = '*'
default[:tilequeue][:tilediff][:cron][:day]                     = '*'
default[:tilequeue][:tilediff][:cron][:user]                    = default[:tilequeue][:user][:user]

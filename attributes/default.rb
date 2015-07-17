#
# Cookbook Name:: tilequeue
# Attributes:: default
#

default[:tilequeue][:cfg_path]                                  = '/etc/tilequeue'
default[:tilequeue][:cfg_file]                                  = 'config.yaml'
default[:tilequeue][:bin_path]                                  = '/usr/local/bin/tilequeue'
default[:tilequeue][:logging_file]                              = 'logging.conf'

default[:tilequeue][:install_method]                            = 'pip_requirements'
default[:tilequeue][:pip_requirements_location]                 = "#{Chef::Config[:file_cache_path]}/tilequeue-pip-requirements.txt"
default[:tilequeue][:pip_requirements] = %w(
  argparse==1.2.1
  boto==2.33.0
  hiredis==0.1.5
  mapbox-vector-tile==0.0.10
  ModestMaps==1.4.6
  Pillow==2.6.1
  protobuf==2.6.0
  psycopg2==2.5.4
  python-memcached==1.53
  PyYAML==3.11
  Shapely==1.4.3
  simplejson==3.6.4
  StreetNames==0.1.5
  git+https://github.com/mapzen/tilequeue#egg=tilequeue
  git+https://github.com/mapzen/TileStache@integration-1#egg=TileStache
  Werkzeug==0.9.6
  wsgiref==0.1.2
)

# default[:tilequeue][:install_method]                            = 'source'
default[:tilequeue][:source][:install_dir]                      = '/opt/tilequeue'
default[:tilequeue][:source][:repo]                             = 'https://github.com/mapzen/tilequeue.git'
default[:tilequeue][:source][:version]                          = 'master'

# tilequeue user to create
default[:tilequeue][:user][:user]                               = 'tilequeue'

# for yaml configuration file
default[:tilequeue][:queue][:type]                              = 'sqs'
default[:tilequeue][:queue][:name]                              = ''
default[:tilequeue][:store][:type]                              = 's3'
default[:tilequeue][:store][:name]                              = ''
default[:tilequeue][:store][:path]                              = ''
default[:tilequeue][:aws][:credentials][:aws_access_key_id]     = ''
default[:tilequeue][:aws][:credentials][:aws_secret_access_key] = ''

default[:tilequeue][:tiles][:all][:enabled]                     = true
default[:tilequeue][:tiles][:all][:zoom_start]                  = 0
default[:tilequeue][:tiles][:all][:zoom_until]                  = 10
default[:tilequeue][:tiles][:metro_extract][:enabled]           = true
default[:tilequeue][:tiles][:metro_extract][:url]               = 'https://raw.githubusercontent.com/mapzen/metroextractor-cities/master/cities.json'
default[:tilequeue][:tiles][:metro_extract][:zoom_start]        = 11
default[:tilequeue][:tiles][:metro_extract][:zoom_until]        = 15
default[:tilequeue][:tiles][:top_tiles][:enabled]               = true
default[:tilequeue][:tiles][:top_tiles][:url]                   = 'https://gist.github.com/brunosan/b7ce3df8b48229a61b5b/raw/37e42e77f253bc204076111c92acc4d5e653edd2/top_50k_tiles.csv'
default[:tilequeue][:tiles][:top_tiles][:zoom_start]            = 11
default[:tilequeue][:tiles][:top_tiles][:zoom_until]            = 20
default[:tilequeue][:tiles][:custom][:enabled]                  = false
default[:tilequeue][:tiles][:custom][:zoom_start]               = 11
default[:tilequeue][:tiles][:custom][:zoom_until]               = 15
default[:tilequeue][:tiles][:custom][:bboxes]                   = []
default[:tilequeue][:tiles][:should_add_to_tiles_of_interest]   = true
default[:tilequeue][:tiles][:expired_location]                  = '/tmp/expired-tiles'
default[:tilequeue][:tiles][:parent_zoom_until]                 = 0

default[:tilequeue][:process][:n_simultaneous_query_sets]       = 0
default[:tilequeue][:process][:log_queue_sizes]                 = true
default[:tilequeue][:process][:log_queue_sizes_seconds]         = 30

default[:tilequeue][:tilestache][:config]                       = '/etc/tilestache/tilestache.conf'
default[:tilequeue][:tilestache][:formats]                      = %w(json)

default[:tilequeue][:logging][:config]                          = "#{default[:tilequeue][:cfg_path]}/logging.conf"

default[:tilequeue][:tilediff][:redis][:host]                   = 'localhost'
default[:tilequeue][:tilediff][:redis][:port]                   = 6379
default[:tilequeue][:tilediff][:redis][:db]                     = 0
default[:tilequeue][:tilediff][:redis][:cache_set_key]          = 'tilequeue.tiles-of-interest'

default[:tilequeue][:tilediff][:script][:path]                  = '/usr/local/bin/tilequeue-tilediff.sh'
default[:tilequeue][:tilediff][:script][:output]                = '/tmp/tilequeue-tilediff.log'
default[:tilequeue][:tilediff][:lock][:pid]                     = '/tmp/tilequeue-tilediff.pid'

default[:tilequeue][:tilediff][:cron][:enabled]                 = true
default[:tilequeue][:tilediff][:cron][:minute]                  = '0'
default[:tilequeue][:tilediff][:cron][:hour]                    = '*'
default[:tilequeue][:tilediff][:cron][:day]                     = '*'
default[:tilequeue][:tilediff][:cron][:user]                    = default[:tilequeue][:user][:user]

default[:tilequeue][:seed][:log_dir]                            = '/var/log/tilequeue'
default[:tilequeue][:seed][:log]                                = '/var/log/tilequeue/seed.log'
default[:tilequeue][:seed][:timeout]                            = 28_800  # 8 hours

default[:tilequeue][:postgresql][:host]                         = 'localhost'
default[:tilequeue][:postgresql][:dbnames]                      = ['osm']
default[:tilequeue][:postgresql][:user]                         = 'osm'
default[:tilequeue][:postgresql][:password]                     = nil

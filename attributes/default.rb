#
# Cookbook Name:: tilequeue
# Attributes:: default
#

default[:tilequeue][:cfg_path]                                  = '/etc/tilequeue'
default[:tilequeue][:cfg_file]                                  = 'config.yaml'
default[:tilequeue][:bin_path]                                  = '/usr/local/bin/tilequeue'
default[:tilequeue][:logging_file]                              = 'logging.conf'

default[:tilequeue][:install_method]                            = 'pip_requirements'
default[:tilequeue][:pip_requirements_location]                 = "#{node[:tilequeue][:cfg_path]}/pip-requirements.txt"
default[:tilequeue][:pip_requirements_extra_location]           = "#{node[:tilequeue][:cfg_path]}/pip-requirements_extra.txt"

default[:tilequeue][:revision][:tilestache] = 'integration-1'
default[:tilequeue][:revision][:mapbox_vector_tile] = 'master'
default[:tilequeue][:revision][:tilequeue] = 'master'

default[:tilequeue][:pip_requirements] = %w(
  argparse==1.2.1
  boto==2.33.0
  hiredis==0.1.5
  ModestMaps==1.4.6
  numpy==1.10.4
  Pillow==2.6.1
  protobuf==2.6.0
  psycopg2==2.5.4
  python-dateutil==2.4.2
  python-memcached==1.53
  PyYAML==3.11
  Shapely==1.4.3
  simplejson==3.6.4
  StreetNames==0.1.5
  Werkzeug==0.9.6
  wsgiref==0.1.2
)

default[:tilequeue][:pip_requirements_extra] = [
  "git+https://github.com/mapzen/TileStache@#{node[:tilequeue][:revision][:tilestache]}#egg=TileStache",
  "git+https://github.com/mapzen/mapbox-vector-tile@#{node[:tilequeue][:revision][:mapbox_vector_tile]}#egg=mapbox-vector-tile",
  "git+https://github.com/mapzen/tilequeue@#{node[:tilequeue][:revision][:tilequeue]}#egg=tilequeue"
]

# tilequeue user to create
default[:tilequeue][:user][:user]                               = 'tilequeue'
default[:tilequeue][:user][:home]                               = "/home/#{node[:tilequeue][:user][:user]}"
default[:tilequeue][:user][:create_group]                       = true
default[:tilequeue][:user][:enabled]                            = true

# for yaml configuration file
default[:tilequeue][:queue][:type]                              = 'sqs'
default[:tilequeue][:queue][:name]                              = ''
default[:tilequeue][:store][:type]                              = 's3'
default[:tilequeue][:store][:name]                              = ''
default[:tilequeue][:store][:path]                              = ''
default[:tilequeue][:store][:date_prefix]                       = ''
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

default[:tilequeue][:process][:formats]                         = %w(json)

default[:tilequeue][:logging][:config]                          = "#{default[:tilequeue][:cfg_path]}/logging.conf"

default[:tilequeue][:vector_datasource][:repository]            = 'https://github.com/mapzen/vector-datasource.git'
default[:tilequeue][:vector_datasource][:revision]              = 'master'
default[:tilequeue][:vector_datasource][:path]                  = "#{node[:tilequeue][:cfg_path]}/vector-datasource"

default[:tilequeue][:intersect][:redis][:host]                  = 'localhost'
default[:tilequeue][:intersect][:redis][:port]                  = 6379
default[:tilequeue][:intersect][:redis][:db]                    = 0
default[:tilequeue][:intersect][:redis][:cache_set_key]         = 'tilequeue.tiles-of-interest'

default[:tilequeue][:intersect][:script][:path]                 = '/usr/local/bin/tilequeue-intersect.sh'
default[:tilequeue][:intersect][:script][:output]               = '/tmp/tilequeue-intersect.log'
default[:tilequeue][:intersect][:lock][:pid]                    = '/tmp/tilequeue-intersect.pid'

default[:tilequeue][:intersect][:cron][:enabled]                = true
default[:tilequeue][:intersect][:cron][:minute]                 = '0'
default[:tilequeue][:intersect][:cron][:hour]                   = '*'
default[:tilequeue][:intersect][:cron][:day]                    = '*'
default[:tilequeue][:intersect][:cron][:user]                   = node[:tilequeue][:user][:user]

default[:tilequeue][:postgresql][:host]                         = 'localhost'
default[:tilequeue][:postgresql][:dbnames]                      = ['osm']
default[:tilequeue][:postgresql][:user]                         = 'osm'
default[:tilequeue][:postgresql][:password]                     = nil

default[:tilequeue][:runit][:timeout]                           = 300

default[:tilequeue][:wof][:meta_url][:neighbourhoods]           = 'https://github.com/whosonfirst/whosonfirst-data/raw/master/meta/wof-neighbourhood-latest.csv'
default[:tilequeue][:wof][:meta_url][:microhoods]               = 'https://github.com/whosonfirst/whosonfirst-data/raw/master/meta/wof-microhood-latest.csv'
default[:tilequeue][:wof][:meta_url][:macrohoods]               = 'https://github.com/whosonfirst/whosonfirst-data/raw/master/meta/wof-macrohood-latest.csv'
default[:tilequeue][:wof][:data_prefix_url]                     = 'http://whosonfirst.mapzen.com/data'
# this defaults to not retrying at all, please override in stack.json or your
# own site recipes.
default[:tilequeue][:wof][:max_retries]                         = 0

default[:tilequeue][:wof][:postgresql][:host]                   = node[:tilequeue][:postgresql][:host]
default[:tilequeue][:wof][:postgresql][:dbname]                 = node[:tilequeue][:postgresql][:dbname]
default[:tilequeue][:wof][:postgresql][:user]                   = node[:tilequeue][:postgresql][:user]
default[:tilequeue][:wof][:postgresql][:password]               = node[:tilequeue][:postgresql][:password]

default[:tilequeue][:force_restart][:script]                    = '/usr/local/bin/tilequeue-process-force-restart.sh'
default[:tilequeue][:force_restart][:setup_ran_path]            = '/etc/tilequeue/setup-ran'

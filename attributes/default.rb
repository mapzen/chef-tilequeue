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

default[:tilequeue][:revision][:raw_tiles] = 'master'
default[:tilequeue][:revision][:mapbox_vector_tile] = 'master'
default[:tilequeue][:revision][:tilequeue] = 'master'

default[:tilequeue][:pip_requirements] = %w(
  appdirs==1.4.3
  argparse==1.4.0
  boto==2.48.0
  enum34==1.1.6
  future==0.16.0
  hiredis==0.2.0
  Jinja2==2.9.6
  MarkupSafe==1.0
  ModestMaps==1.4.7
  protobuf==3.4.0
  psycopg2==2.7.3.2
  pyclipper==1.0.6
  pycountry==17.9.23
  pyproj==1.9.5.1
  python-dateutil==2.6.1
  PyYAML==3.12
  redis==2.10.6
  requests==2.18.4
  Shapely==1.6.2.post1
  six==1.11.0
  StreetNames==0.1.5
  statsd==3.2.1
  ujson==1.35
  Werkzeug==0.12.2
  wsgiref==0.1.2
  zope.dottedname==4.2
  edtf==2.6.0
)

default[:tilequeue][:pip_requirements] += [
  "git+https://github.com/tilezen/mapbox-vector-tile@#{node[:tilequeue][:revision][:mapbox_vector_tile]}#egg=mapbox-vector-tile",
  "git+https://github.com/tilezen/raw_tiles@#{node[:tilequeue][:revision][:raw_tiles]}#egg=raw_tiles",
  "git+https://github.com/tilezen/tilequeue@#{node[:tilequeue][:revision][:tilequeue]}#egg=tilequeue"
]

# tilequeue user to create
default[:tilequeue][:user][:user]                               = 'tilequeue'
default[:tilequeue][:user][:home]                               = "/home/#{node[:tilequeue][:user][:user]}"
default[:tilequeue][:user][:create_group]                       = true
default[:tilequeue][:user][:enabled]                            = true

# for yaml configuration file

default[:tilequeue][:queue] = [
  {
    type: 'sqs',
    name: '',
    region: '',
  }
]
default[:tilequeue][:queue_mapping][:type] = ''
default[:tilequeue][:message_marshall][:type] = ''
default[:tilequeue][:in_flight][:type] = ''
default[:tilequeue][:message_tracker][:type] = ''

default[:tilequeue][:message_visibility][:extend_seconds]       = 1800
default[:tilequeue][:message_visibility][:max_seconds]          = 43200
default[:tilequeue][:message_visibility][:timeout_seconds]      = 3600

default[:tilequeue][:store][:type]                              = 's3'
default[:tilequeue][:store][:name]                              = ''
default[:tilequeue][:store][:path]                              = ''
default[:tilequeue][:store][:date_prefix]                       = ''
default[:tilequeue][:store][:reduced_redundancy]                = true
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
default[:tilequeue][:process][:n_simultaneous_s3_storage]       = 0
default[:tilequeue][:process][:log_queue_sizes]                 = true
default[:tilequeue][:process][:log_queue_sizes_seconds]         = 30

default[:tilequeue][:process][:formats]                         = %w(json)
default[:tilequeue][:process][:buffer]                          = nil

default[:tilequeue][:logging][:config]                          = "#{default[:tilequeue][:cfg_path]}/logging.conf"

default[:tilequeue][:vector_datasource][:repository]            = 'https://github.com/mapzen/vector-datasource.git'
default[:tilequeue][:vector_datasource][:path]                  = "#{node[:tilequeue][:cfg_path]}/vector-datasource"
default[:tilequeue][:revision][:vector_datasource]              = 'master'

default[:tilequeue][:redis][:host]                              = 'localhost'
default[:tilequeue][:redis][:port]                              = 6379
default[:tilequeue][:redis][:db]                                = 0

default[:tilequeue][:postgresql][:host]                         = 'localhost'
default[:tilequeue][:postgresql][:dbnames]                      = ['osm']
default[:tilequeue][:postgresql][:user]                         = 'osm'
default[:tilequeue][:postgresql][:password]                     = nil

default[:tilequeue][:runit][:timeout]                           = 300

default[:tilequeue][:wof][:meta_url][:neighbourhoods]           = 'https://github.com/whosonfirst/whosonfirst-data/raw/master/meta/wof-neighbourhood-latest.csv'
default[:tilequeue][:wof][:meta_url][:microhoods]               = 'https://github.com/whosonfirst/whosonfirst-data/raw/master/meta/wof-microhood-latest.csv'
default[:tilequeue][:wof][:meta_url][:macrohoods]               = 'https://github.com/whosonfirst/whosonfirst-data/raw/master/meta/wof-macrohood-latest.csv'
default[:tilequeue][:wof][:meta_url][:boroughs]                 = 'https://github.com/whosonfirst/whosonfirst-data/raw/master/meta/wof-borough-latest.csv'
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

default[:tilequeue][:metatile][:enabled]                        = false
default[:tilequeue][:metatile][:size]                           = 1

default[:tilequeue][:toiprune][:enabled]                        = false

default[:tilequeue][:statsd][:enabled]                          = false

default[:tilequeue][:toistore][:type]                           = 's3'
default[:tilequeue][:toistore][:s3][:bucket]                    = ''
default[:tilequeue][:toistore][:s3][:key]                       = ''
default[:tilequeue][:toistore][:file][:name]                    = ''

default[:tilequeue][:rawr][:group_zoom]                         = 10
default[:tilequeue][:rawr][:queue][:name]                       = ''
default[:tilequeue][:rawr][:queue][:wait_seconds]               = 20
default[:tilequeue][:rawr][:queue][:region]                     = ''
default[:tilequeue][:rawr][:postgresql][:host]                  = ''
default[:tilequeue][:rawr][:postgresql][:dbname]                = ''
default[:tilequeue][:rawr][:postgresql][:user]                  = ''
default[:tilequeue][:rawr][:postgresql][:password]              = ''
default[:tilequeue][:rawr][:sink][:bucket]                      = ''
default[:tilequeue][:rawr][:sink][:region]                      = ''
default[:tilequeue][:rawr][:sink][:prefix]                      = ''
default[:tilequeue][:rawr][:sink][:suffix]                      = '.zip'
# source type can be "store", "generator", or "s3"
default[:tilequeue][:rawr][:source][:type]                      = 's3'
default[:tilequeue][:rawr][:source][:bucket]                    = ''
default[:tilequeue][:rawr][:source][:region]                    = ''
default[:tilequeue][:rawr][:source][:prefix]                    = ''
default[:tilequeue][:rawr][:source][:suffix]                    = '.zip'
default[:tilequeue][:rawr][:use_rawr_tiles]                     = true

# toi, none, all, all-parents
# typically set to toi
default[:tilequeue][:rawr][:intersect][:type]                   = ''

CHANGELOG
=========

0.12.0
------
* Add chef support for toi-store configuration
* Remove store_metatile_and_originals configuration

0.11.0
------
* Peg appdirs to 1.4.3. (See [#34](https://github.com/tilezen/chef-tilequeue/pull/34))
* Add support for the tilequeue pruning command. (See [#35](https://github.com/tilezen/chef-tilequeue/pull/35), [#37](https://github.com/tilezen/chef-tilequeue/pull/37), [#38](https://github.com/tilezen/chef-tilequeue/pull/38), and [#39](https://github.com/tilezen/chef-tilequeue/pull/39))
* Add support for statsd in tilequeue command.py. (See [#36](https://github.com/tilezen/chef-tilequeue/pull/36))

0.10.0
------
* Remove configuration of layers to format. (See https://github.com/tilezen/chef-tilequeue/issues/31)

0.9.0
-----
* Support reduced redundancy configuration

0.8.0
-----
* Peg usjon version

0.7.1
-----
* Add support for priority queue configuration
* Add support for metatile configuration

0.7.0
-----
* Support simultaneous s3 storage threads configuration

0.6.0
-----
* Update software revision variable name
* Add configuration for wof boroughs meta url
* Update python dependencies
  - remove unused python packages and package dependencies
  - add pycountry python dependency
  - add pyclipper python dependency
* Add support for per format buffer configuration

0.5.0
-----
* Remove tilequeue intersect cron

0.4.0
-----
* Ensure all python package versions are pegged

0.3.0
-----
* Support configuration for storing layer formats

0.2.1
-----
* Update python dependencies
* Add configuration for retrying WOF HTTP fetches.

0.1.4
-----
* Support store date-prefix config

0.1.3
-----
* Add script to force restart processors

0.1.2
-----
* Support custom revision of mapbox-vector-tile
* Configure WOF neighbourhood processing

0.1.1
-----
* Introduce an easier way to override revisions

0.1.0
-----
* Updates to support vector-datasource query templates
* Re-organize recipes

0.0.15
------
* Bump pip requirements

0.0.14
------
* Allow more explicit control over seed config
* Bump pip requirements

0.0.13
------
* Update tilequeue config.yaml generation

0.0.12
------
* increase runit restart timeout

0.0.11
------
* update configuration for seed and intersect
* add config to support seeding at low zooms
* remove unused seed recipe

0.0.10
------
* bump mapbox-vector-tile -> 0.0.7

0.0.9
-----
* remove no longer used psutil
* update tilequeue configuration

0.0.8
-----
* config updates to support pgbouncer

0.0.7
-----
* add enqueue_tiles_of_interest logger

0.0.6
-----
* run seed process with timeout
* bump mapbox-vector-tile -> 0.0.6

0.0.5
-----
* remove unused tilequeue configuration

0.0.4
-----
* update tilequeue logging configuration

0.0.3
-----
* update tiles of interest key

0.0.2
-----
* factor out creating a user to separate recipe

0.0.1
-----
* stable

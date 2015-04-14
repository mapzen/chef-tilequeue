name             'tilequeue'
maintainer       'mapzen'
maintainer_email 'rob@mapzen.com'
license          'GPL v3'
description      'Installs/Configures tilequeue'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.9'

recipe 'tilequeue', 'Installs tilequeue'

%w(
  apt
  git
  python
  runit
  user
).each do |dep|
  depends dep
end

%w(ubuntu).each do |os|
  supports os
end

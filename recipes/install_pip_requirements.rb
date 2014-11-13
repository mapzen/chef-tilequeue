#
# Cookbook Name:: tilequeue
# Recipe:: install_pip_requirements
#

# generate a pip requirements file for consistent python package
# versions
file node[:tilequeue][:pip_requirements_location] do
  content node[:tilequeue][:pip_requirements].join("\n")
end

# install python packages from requirements file
python_pip "-U -r #{node[:tilequeue][:pip_requirements_location]}"

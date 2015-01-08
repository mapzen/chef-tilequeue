require 'spec_helper'

describe 'tilequeue::install' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set[:tilequeue][:pip_requirements] = %w(requirement-one requirement-two)
    end.converge(described_recipe)
  end

  it 'should create template /etc/tilequeue/config.yaml' do
    expect(chef_run).to create_template('/etc/tilequeue/config.yaml').with(
      source: 'tilequeue-config.yaml.erb'
    )
  end
  it 'should create template /etc/tilequeue/logging.conf' do
    expect(chef_run).to create_template('/etc/tilequeue/logging.conf').with(
      source: 'tilequeue-logging.conf.erb'
    )
  end

  it 'should python_pip install the requirements file' do
    expect(chef_run).to install_python_pip "-U -r #{Chef::Config[:file_cache_path]}/tilequeue-pip-requirements.txt"
  end

  %w(config.yaml logging.conf).each do |f|
    it "should create the template #{f}" do
      expect(chef_run).to create_template("/etc/tilequeue/#{f}").with(
        source: "tilequeue-#{f}.erb"
      )
    end
  end
end

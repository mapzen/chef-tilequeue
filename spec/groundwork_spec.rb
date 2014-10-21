require 'spec_helper'

describe 'tilequeue::groundwork' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set[:tilequeue][:pip_requirements] = '/tmp/requirements.txt'
    end.converge(described_recipe)
  end

  %w(python-dev libgeos-dev libpq-dev).each do |p|
    it "should install the package #{p}" do
      expect(chef_run).to install_package p
    end
  end

  it 'should create the directory /etc/tilequeue' do
    expect(chef_run).to create_directory('/etc/tilequeue').with(
      owner: 'tilestache',
      group: 'tilestache'
    )
  end
end

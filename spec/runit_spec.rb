require 'spec_helper'

describe 'tilequeue::runit' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set[:tilequeue][:pip_requirements] = '/tmp/requirements.txt'
    end.converge(described_recipe)
  end

  it 'should include the recipe runit::default' do
    expect(chef_run).to include_recipe 'runit::default'
  end

  it 'should enable and start the tilequeue runit service' do
    expect(chef_run).to enable_runit_service('tilequeue').with(
      action:         [:enable, :start],
      log:            true,
      default_logger: true,
      sv_timeout:     30
    )
  end
end

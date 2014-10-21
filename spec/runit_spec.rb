require 'spec_helper'

describe 'tilequeue::runit' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

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

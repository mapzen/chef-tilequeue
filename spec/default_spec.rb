require 'spec_helper'

describe 'tilequeue::default' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set[:tilequeue][:pip_requirements] = '/tmp/requirements.txt'
    end.converge(described_recipe)
  end

  %w(
    apt::default
    git::default
    python::package
    tilestache::default
    tilequeue::groundwork
    tilequeue::install
  ).each do |r|
    it "should include the recipe #{r}" do
      expect(chef_run).to include_recipe r
    end
  end
end

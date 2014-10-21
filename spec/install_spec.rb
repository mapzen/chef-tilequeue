require 'spec_helper'

describe 'tilequeue::install' do
  context 'with (more or less) defaults' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set[:tilequeue][:pip_requirements] = '/tmp/requirements.txt'
      end.converge(described_recipe)
    end

    it 'should create template blah' do
      expect(chef_run).to create_template('/tmp/requirements.txt').with(
        source: 'tilequeue-pip-requirements.txt.erb'
      )
    end

    it 'should python_pip install the requirements file' do
      expect(chef_run).to install_python_pip '-r /tmp/requirements.txt'
    end

    %w(config.yaml logging.conf).each do |f|
      it "should create the template #{f}" do
        expect(chef_run).to create_template("/etc/tilequeue/#{f}").with(
          source: "tilequeue-#{f}.erb"
        )
      end
    end
  end
end

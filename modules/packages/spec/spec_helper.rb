require 'rspec-puppet'
require 'puppetlabs_spec_helper/module_spec_helper'

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

RSpec.configure do |c|
  c.mock_framework = :rspec
  c.module_path = File.join(fixture_path, 'modules')
  c.manifest_dir = File.join(fixture_path, 'manifests')
  c.hiera_config = File.join(fixture_path, 'hiera.yaml')
  c.default_facts = {
    boxen_home: '/opt/boxen',
    boxen_repodir: '/opt/boxen/repo',
    boxen_reponame: 'repo',
    boxen_srcdir: '/opt/boxen/repo',
    github_login: 'github_login',
    boxen_repo_url_template: 'boxen_repo_url_template',
  }
end

# Puppet::Util::Log.level = :debug
# Puppet::Util::Log.newdestination(:console)

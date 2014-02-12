require 'spec_helper'

describe 'people::jdigger::ruby' do

  # Puppet::Util::Log.level = :debug
  # Puppet::Util::Log.newdestination(:console)

  let :facts do {
    :boxen_user => 'test_user',
    # :boxen_home => '/opt/boxen',
    # :boxen_repodir => 'spec/fixtures',
    # :github_login => 'gh_test_user',
  } end

  it do
    should contain_class('ruby::global')
  end

end

# == Description
#
# Scripts and similiar for Jim Moore (aka "jdigger").
#
class people::jdigger::bin {

  # Gradle Wrapper finder script
  file { '/usr/bin/gw':
    source  => 'puppet:///modules/people/jdigger/bin/gw',
    mode    => '0755',
  }

}

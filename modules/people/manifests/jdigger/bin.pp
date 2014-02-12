# == Description
#
# Scripts and similiar for Jim Moore (aka "jdigger").
#
class people::jdigger::bin {
  include git

  $home = "/Users/${::boxen_user}"

  ensure_resource('file', "${home}/bin", {ensure => 'directory'})

  # Gradle Wrapper finder script
  file { "${home}/bin/gw":
    source  => 'puppet:///modules/people/jdigger/bin/gw',
    require => File["${home}/bin"],
  }

}

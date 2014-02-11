# == Description
#
# Lastpass Password manager
# http://lastpass.com/
#
class packages::lastpass (
  $source = 'https://lastpass.com/download/cdn/lpmacosx.dmg',
) {

  package { 'Lastpass':
    source   => $source,
    provider => 'pkgdmg',
  }


  if defined('chrome') {
    require 'chrome'
  }
  if defined('firefox') {
    require 'firefox'
  }

}

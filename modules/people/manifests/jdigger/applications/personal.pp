# == Description
#
# Applications specific for Jim Moore (aka "jdigger") on
# his personal (non-work) machines.
#
class people::jdigger::applications::personal {

  include 'calibre'
  include 'crashplan'
  include 'handbrake'
  include 'imagemagick'
  include 'packages::mac_dvd_ripper_pro'
  include 'packages::truecrypt'
  include 'steam'

  # Leawo Tunes Cleaner (iTunes music metadata cleaner)
  # http://www.leawo.com/tunes-cleaner-mac/
  package { 'Tunes Cleaner from Leawo':
    source   => 'http://download.leawo.com/download.php?eefc9e10ebdc4a2333b42b2dbb8f27b6',
    provider => 'pkgdmg',
  }

  # Flux 4 web site editor
  # http://www.theescapers.com/flux/
  package { 'Flux 4':
    source   => 'http://instruktion.net/theescapers/downloads/FluxV4.zip',
    provider => 'compressed_app',
  }

}

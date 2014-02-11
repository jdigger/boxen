# == Description
#
# TrueCrypt encryption
# http://www.truecrypt.org/
#
class packages::truecrypt (
  $source = 'http://macapps.mooregreatsoftware.com.s3.amazonaws.com/TrueCrypt-7.1a-OSX.dmg',
) {

  package { 'TrueCrypt':
    source   => $source,
    provider => 'pkgdmg',
    require  => Package['osxfuse'],
  }

  if ! defined(Package['osxfuse']) {
    package { 'osxfuse':
      provider => 'homebrew',
    }
  }

}

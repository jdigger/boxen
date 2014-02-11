# == Description
#
# DVD Ripper
# http://www.macxdvd.com/mac-dvd-ripper-pro/
#
class packages::mac_dvd_ripper_pro (
  $source = 'http://macapps.mooregreatsoftware.com.s3.amazonaws.com/macx-dvd-ripper-pro-4.4.4.dmg',
) {

  package { 'MacxDvdRipperPro':
    source   => $source,
    provider => appdmg,
  }

}

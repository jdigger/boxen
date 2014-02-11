# == Description
#
# Bookmark manager
# http://www.sheepsystems.com/products/bkmx/
#
class packages::bookmacster (
  $source = 'http://macapps.mooregreatsoftware.com.s3.amazonaws.com/BookMacster-1.19.1.zip',
) {

  package { 'BookMacster':
    source   => $source,
    provider => compressed_app,
  }

  if defined('chrome') {
    require 'chrome'
  }
  if defined('firefox') {
    require 'firefox'
  }

}

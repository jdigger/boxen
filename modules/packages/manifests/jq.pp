# == Description
#
# Installs the 'jq' package, a 'sed' for JSON.
# http://stedolan.github.io/jq/
#
class packages::jq {

  package { 'jq':
    ensure   => 'latest',
    provider => 'homebrew',
  }

}

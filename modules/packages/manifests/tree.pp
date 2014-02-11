# == Description
#
# Installs the standard 'tree' unix program
# http://mama.indstate.edu/users/ice/tree/
#
class packages::tree {

  package { 'tree':
    ensure   => 'present',
    provider => 'homebrew',
  }

}

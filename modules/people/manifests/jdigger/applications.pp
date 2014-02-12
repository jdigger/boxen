# == Description
#
# Applications specific for Jim Moore (aka "jdigger").
#
# == Parameters
#
# [*system_roles*]
#   An array of the roles that this system participates in.
#   Valid values are 'work' and 'personal'. If not passed in,
#   it is looked up in hiera using the key 'people::jdigger::system_roles'
#
class people::jdigger::applications (
  $system_roles = undef
) {

  $_system_roles = hiera_array('people::jdigger::system_roles', [])
  $roles = $system_roles ? { undef => $_system_roles, default => $system_roles}

  include people::jdigger::applications::general

  if member($roles, 'work') {
    include 'people::jdigger::applications::work'
  }
  elsif member($roles, 'personal') {
    include 'people::jdigger::applications::personal'
  }

}

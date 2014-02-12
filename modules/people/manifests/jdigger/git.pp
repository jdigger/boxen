# == Description
#
# Git settings and repositories specific for Jim Moore (aka "jdigger").
#
# == Parameters
#
# [*system_roles*]
#   An array of the roles that this system participates in.
#   Valid values are 'work' and 'personal'. If not passed in,
#   it is looked up in hiera using the key 'people::jdigger::system_roles'
#
class people::jdigger::git (
  $system_roles = undef
) {

  $_system_roles = hiera_array('people::jdigger::system_roles')
  $roles = $system_roles ? { undef => $_system_roles, default => $system_roles}

  require people::jdigger::dotfiles

  include git
  include people::jdigger::git::global
  include people::jdigger::git::general

  if member($roles, 'work') {
    include people::jdigger::git::work
  }
  elsif member($roles, 'personal') {
    include people::jdigger::git::personal
  }
  else {
    $roles_str = join($roles, ', ')
    notify {"system_role is neither personal or work: ${roles_str}" :}
  }

}

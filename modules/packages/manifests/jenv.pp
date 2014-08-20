# == Description
#
# Sets up AsciiDoc and the XSLT it needs for DocBook.
#
class packages::jenv {
  homebrew::tap { 'jenv/jenv': }

  package { 'jenv':
    provider => homebrew,
  }

  $home = "/Users/${::boxen_user}"

  file { "${home}/.jenv":
    ensure => 'directory',
  }
}

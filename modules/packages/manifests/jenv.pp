# == Description
#
# jEnv is a command line tool to help you forget how to set the JAVA_HOME environment variable
#
# http://www.jenv.be/
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

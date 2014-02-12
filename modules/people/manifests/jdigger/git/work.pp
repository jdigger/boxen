# == Description
#
# Git repositories specific for Jim Moore (aka "jdigger") that
# should be on his work machines.
#
class people::jdigger::git::work {

  include 'projects::omega'

  $home = "/Users/${::boxen_user}"
  $srcdir = "${home}/src"

  validate_absolute_path($srcdir)

  git::config::local { "${srcdir}/omega":
    key     => 'user.email',
    value   => 'james.moore3@twcable.com',
    require => Class['projects::omega']
  }

  repository { "${srcdir}/cq-gradle-plugins" :
    source => 'https://github.webapps.rr.com/webcms/cq-gradle-plugins.git',
    path   => "${srcdir}/cq-gradle-plugins",
  }
  ->
  git::config::local { "${srcdir}/cq-gradle-plugins":
    key   => 'user.email',
    value => 'james.moore3@twcable.com',
  }

  repository { "${srcdir}/git-process" :
    source => 'https://github.com/jdigger/git-process.git',
    path   => "${srcdir}/git-process",
  }
  ->
  git::config::local { "${srcdir}/git-process":
    key   => 'user.email',
    value => 'moore.jim@gmail.com',
  }

}

# == Description
#
# Git repositories specific for Jim Moore (aka "jdigger")
# that should be on all his machines.
#
class people::jdigger::git::general {

  $home = "/Users/${::boxen_user}"
  $srcdir = "${home}/src"

  validate_absolute_path($srcdir)

  repository { "${srcdir}/octopress" :
    source => 'https://jdigger@bitbucket.org/jdigger/octopress.git',
    path   => "${srcdir}/octopress",
  }
  ->
  git::config::local { "${srcdir}/octopress":
    key   => 'user.email',
    value => 'moore.jim@gmail.com',
  }

}

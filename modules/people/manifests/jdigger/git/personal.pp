# == Description
#
# Git repositories specific for Jim Moore (aka "jdigger") that
# should be on his personal (non-work) machines.
#
class people::jdigger::git::personal {

  $home = "/Users/${::boxen_user}"
  $srcdir = "${home}/src"

  validate_absolute_path($srcdir)

  repository { "${srcdir}/flickr2picasa" :
    source => 'git@bitbucket.org:jdigger/flickr2picasa.git',
    path   => "${srcdir}/flickr2picasa",
  }
  ->
  git::config::local { "${srcdir}/flickr2picasa":
    key   => 'user.email',
    value => 'moore.jim@gmail.com',
  }


  repository { "${srcdir}/flickr" :
    source => 'https://jdigger@bitbucket.org/jdigger/flickr.git',
    path   => "${srcdir}/flickr",
  }
  ->
  git::config::local { "${srcdir}/flickr":
    key   => 'user.email',
    value => 'moore.jim@gmail.com',
  }


  repository { "${srcdir}/spring-social-flickr" :
    source => 'https://github.com/jdigger/spring-social-flickr.git',
    path   => "${srcdir}/spring-social-flickr",
  }
  ->
  git::config::local { "${srcdir}/spring-social-flickr":
    key   => 'user.email',
    value => 'moore.jim@gmail.com',
  }

}

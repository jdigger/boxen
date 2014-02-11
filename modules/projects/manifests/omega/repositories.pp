# == Description
#
# Repositories specific for the 'omega' project.
#
class projects::omega::repositories(
  $srcdir = undef
) {

  if $srcdir {
    $_srcdir = $srcdir
  }
  else {
    $home = "/Users/${::boxen_user}"
    $_srcdir = "${home}/src"
  }

  validate_absolute_path($_srcdir)

  repository { "${_srcdir}/omega" :
    source => 'https://github.webapps.rr.com/webcms/omega.git',
    path   => "${_srcdir}/omega",
  }

}

# == Description
#
# Google Closure Linter
# https://developers.google.com/closure/utilities/
#
class packages::gjslint (
  $source_tgz = 'http://closure-linter.googlecode.com/files/closure_linter-latest.tar.gz',
) {

  exec { 'install gjslint':
    command => "easy_install ${source_tgz}",
    user    => 'root',
    creates => '/usr/local/bin/gjslint',
  }

}

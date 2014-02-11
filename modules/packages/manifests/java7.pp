# == Description
#
# Installs Java 7
#
# == Parameters
#
# [*source*]
#   The source URL to get the DMG from.
#
# [*update*]
#   The update version (e.g., 'u45') to install. *Ignored* if 'source' is provided.
#
class packages::java7 (
  $source = undef,
  $update = 'u45',
) {

  if $source {
    $url = $source
  }
  else {
    $url = "http://relic.lab.webapps.rr.com/artifactory/files-local/oracle/java/7${update}-macosx/java-7${update}-macosx-x64.dmg"
  }

  package { "java7${update}":
    ensure   => 'installed',
    source   => $url,
    provider => 'pkgdmg',
  }

}

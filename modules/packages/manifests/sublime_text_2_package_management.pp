# == Description
#
# Provides a nice "shim" for easily adding Sublime Text 2 packages,
# especially using Hiera data.
#
# == Hiera
#
# Hiera will do a "hash merge" on "sublime_text_2::packages"
#
# == Parameters
#
# [*the_packages*]
#   A hash of the packages to install, where the key is the
#   package name and the value is another hash containing a
#   'source' key gives the git repository (in GitHub.com)
#   containing the package.
#   If this is provided, the hiera hash merge will not be used.
#
# == Examples
#
# In Hiera:
#
# sublime_text_2::packages:
#   'Git':
#     source: 'kemayo/sublime-text-git'
#   'GitGutter':
#     source: 'jisaacks/GitGutter'
#
class packages::sublime_text_2_package_management (
  $the_packages = undef
) {

  if $the_packages {
    $packages = $the_packages
  }
  else {
    $packages = hiera_hash('sublime_text_2::packages', {})
  }

  validate_hash($packages)
  create_resources('sublime_text_2::package', $packages)
}

# == Description
#
# Adds a link to invoke SourceTree from the command line: `stree`
#
class packages::sourcetree_cli {

  include sourcetree

  file { '/usr/bin/stree':
    ensure  => 'link',
    target  => '/Applications/SourceTree.app/Contents/Resources/stree',
    require => Class['sourcetree']
  }

}

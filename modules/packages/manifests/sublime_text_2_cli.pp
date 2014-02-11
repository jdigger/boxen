# == Description
#
# Adds a link to invoke Sublime Text 2 from the command line: `subl`
#
class packages::sublime_text_2_cli {

  include sublime_text_2

  file { '/usr/bin/subl':
    ensure  => 'link',
    target  => '/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl',
    require => Class['sublime_text_2']
  }

}

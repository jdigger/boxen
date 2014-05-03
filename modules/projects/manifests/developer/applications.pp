# == Description
#
# Applications specific for the 'developer' project.
#
class projects::developer::applications {

  include 'chrome'
  include 'firefox'
  include 'intellij'
  include 'iterm2::stable'
  include 'p4merge'
  include 'packages::git_process'
  include 'packages::gjslint'
  include 'packages::jq'
  include 'packages::sourcetree_cli'
  include 'packages::sublime_text_2_cli'
  include 'packages::sublime_text_2_package_management'
  include 'packages::tree'
  include 'sourcetree'
  include 'sublime_text_2'
  include 'vagrant'
  include 'virtualbox'
  include 'wget'

}

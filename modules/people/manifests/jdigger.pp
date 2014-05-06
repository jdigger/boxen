# == Description
#
# Machine configuration specific for Jim Moore (aka "jdigger").
#
class people::jdigger {

  include people::jdigger::dotfiles
  include people::jdigger::bin
  include people::jdigger::applications
  include people::jdigger::ruby
  include people::jdigger::git
  include people::jdigger::sublime_text_2
  include people::jdigger::osx

}

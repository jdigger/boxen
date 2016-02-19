# == Description
#
# Applications specific for Jim Moore (aka "jdigger")
# that should be on all his machines.
#
class people::jdigger::applications::general {

  include 'adium'
  include 'augeas'
  include 'caffeine'
  include 'chrome'
  include 'cloudapp'
  include 'cyberduck'
  include 'docker'
  include 'dropbox'
  include 'firefox'
  include 'git'
  include 'googledrive'
  include 'graphviz'
  include 'heroku'
  # include 'intellij'
  include 'iterm2::stable'
  include 'kindle'
  include 'launchbar'
  include 'mongodb'
  include 'nodejs::global'
  include 'omnigraffle::pro'
  include 'packages::asciidoc'
  include 'packages::bookmacster'
  include 'packages::hermes'
  include 'packages::jenv'
  include 'packages::lastpass'
  include 'packages::springboot'
  include 'packages::sourcetree_cli'
  include 'people::jdigger::applications::adium'
  include 'skitch'
  include 'skydrive'
  include 'skype'
  include 'sourcetree'
  include 'spotify'
  include 'sublime_text_2'
  include 'tmux'
  include 'vagrant'
  include 'virtualbox'
  include 'zsh'

  package { 'httpie':
    provider => 'homebrew',
    ensure => 'latest'
  }

# Window mover, resizer and more
  # http://www.binarybakery.com/product.php?app=windownaut
  # package { 'Windownaut':
  #   source   => 'http://macapps.mooregreatsoftware.com.s3.amazonaws.com/Windownaut-1.2.6.dmg',
  #   provider => appdmg,
  # }

  # include 'iterm2::colors::solarized_dark'

}

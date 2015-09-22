# == Description
#
# Applications specific for Jim Moore (aka "jdigger")
# that should be on all his machines.
#
class people::jdigger::applications::general {

  # include 'adium'
  package { 'adium': provider => 'brewcask', ensure => '>= 1.5.10' }
  include 'augeas'
  # include 'caffeine'
  package { 'caffeine': provider => 'brewcask', ensure => '>= 1.1.1' }
  include 'chrome'
  include 'cloudapp'
  include 'cyberduck'
  include 'docker'
  package { 'dropbox': provider => 'brewcask'}
  package { 'firefox': provider => 'brewcask' }
  include 'git'
  include 'googledrive'
  include 'graphviz'
  include 'heroku'
  # include 'intellij'
  package { 'intellij-idea': provider => 'brewcask', ensure => '14.1.3' }
  include 'iterm2::stable'
  package { 'java': provider => 'brewcask', ensure => '1.8.0_45' }
  include 'kindle'
  # include 'launchbar'
  package { 'launchbar': provider => 'brewcask', ensure => '5.6.4' }
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
  package { 'path-finder': provider => 'brewcask' }
  include 'skitch'
  include 'skydrive'
  # include 'skype'
  package { 'skype': provider => 'brewcask' }
  include 'sourcetree'
  include 'spotify'
  # include 'sublime_text_2'
  # package { 'sublime-text': provider => 'brewcask', ensure => 'latest' }
  include 'tmux'
  include 'vagrant'
  # package { 'vagrant': provider => 'brewcask', ensure => 'latest' }
  include 'virtualbox'
  include 'zsh'

  package { 'httpie': provider => 'homebrew', ensure => 'latest' }

# Window mover, resizer and more
  # http://www.binarybakery.com/product.php?app=windownaut
  # package { 'Windownaut':
  #   source   => 'http://macapps.mooregreatsoftware.com.s3.amazonaws.com/Windownaut-1.2.6.dmg',
  #   provider => appdmg,
  # }

  # include 'iterm2::colors::solarized_dark'

}

# == Description
#
# A set of scripts for a sane git process
# https://github.com/jdigger/git-process
#
# This installs the git-process gem for the 'global' ruby version.
#
class packages::git_process {
  include 'git'
  include 'ruby'

  require 'ruby::global'

  validate_re($ruby::global::version, '^\S+')

  ruby_gem { "git-process for ${ruby::global::version}":
    gem          => 'git-process',
    ruby_version => '*',
    version      => '~> 2.0'
  }

}

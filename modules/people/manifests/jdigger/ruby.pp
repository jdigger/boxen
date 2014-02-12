# == Description
#
# Ruby settings and gems specific for Jim Moore (aka "jdigger").
#
class people::jdigger::ruby {

  require 'ruby::global'

  validate_re($ruby::global::version, '^\S+')

  ruby::gem { "asciidoctor for ${ruby::global::version}":
    gem     => 'asciidoctor',
    ruby    => $ruby::global::version,
    version => '~> 0.1.4'
  }

}

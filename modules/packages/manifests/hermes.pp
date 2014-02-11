# == Description
#
# Hermes Pandora player
# http://alexcrichton.com/hermes/
#
class packages::hermes (
  $source = 'https://s3.amazonaws.com/alexcrichton-hermes/Hermes-1.1.20.zip',
) {

  package { 'HermesPandora':
    source   => $source,
    provider => compressed_app,
  }

}

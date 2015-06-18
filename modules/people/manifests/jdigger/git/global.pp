# == Description
#
# Git settings anspecific for Jim Moore (aka "jdigger")
# that should be on all his machines.
#
class people::jdigger::git::global {

  git::config::global {
    'user.name':     value  => 'Jim Moore';
    'push.default':  value  => 'current';
    'core.autocrlf': value  => 'input';
    'core.safecrlf': value  => 'warn';
    'core.editor':   value  => 'subl -w';
  }

}

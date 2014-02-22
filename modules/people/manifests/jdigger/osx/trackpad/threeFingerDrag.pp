# == Description
#
# Enable/Disable three-finger drag
#
class people::jdigger::osx::trackpad::threeFingerDrag (
  $enable = true,
) {

  boxen::osx_defaults { 'trackpad three finger drag - global':
    host   => 'currentHost',
    domain => 'NSGlobalDomain',
    key    => 'com.apple.trackpad.threeFingerDragGesture',
    value  => $enable,
    user   => $::boxen_user,
  }

  boxen::osx_defaults { 'trackpad three finger drag - driver':
    domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
    key    => 'TrackpadThreeFingerDrag',
    value  => $enable,
    user   => $::boxen_user,
  }

}

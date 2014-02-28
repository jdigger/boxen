# == Description
#
# Set a preference for Adium
#
define people::jdigger::applications::adium_pref (
  $file,
  $key,
  $value,
  $preferences_dir = 'UNSET',
) {

  if $preferences_dir == 'UNSET' {
    $home = "/Users/${::boxen_user}"
    $pdir = "${home}/Library/Application Support/Adium 2.0/Users/Default"
  }
  else {
    $pdir = $preferences_dir
  }

  if $file =~ /\.plist$/ {
    $_filename = $file
  }
  else {
    $_filename = "${file}.plist"
  }

  $path = "${pdir}/${_filename}"


  property_list_key { "Adium preference ${path} for ${key}":
    path  => $path,
    key   => $key,
    value => $value,
  }

}

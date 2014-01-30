class projects::omega {

  # browsers
  include chrome
  # alternates: chrome::beta, chrome::dev, chrome:canary, chrome::chromium
  include firefox
  # alternates: firefox::nightly

  package { 'Java7u45':
    ensure => installed,
    source => 'http://relic.lab.webapps.rr.com/artifactory/files-local/oracle/java/7u45-macosx/java-7u45-macosx-x64.dmg',
    provider => pkgdmg,
  }

}

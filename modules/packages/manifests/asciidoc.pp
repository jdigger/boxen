# == Description
#
# Sets up AsciiDoc and the XSLT it needs for DocBook.
#
class packages::asciidoc {

  package { ['docbook-xsl', 'asciidoc']:
    provider => homebrew,
  }

  $home = "/Users/${::boxen_user}"

  if defined(File["${home}/.zshenv"]) {
    file_line { 'export XML_CATALOG_FILES':
      # needing to export this variable is a hack for OS X
      # needing to export it to /opt/boxen/* is a hack for Boxen...
      line    => 'export XML_CATALOG_FILES="/opt/boxen/homebrew/etc/xml/catalog"',
      path    => "${home}/.zshenv",
      require => File["${home}/.zshenv"],
    }
  }

}

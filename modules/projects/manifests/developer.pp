class projects::developer {
  notify { 'DEBUG: class projects::developer declared': }

  $home     = "/Users/${::boxen_user}"

  # useful Omega dev tools
  include iterm2::stable
  include p4merge

  include ruby::1_9_3   # not confident that this is the proper default version
  class { 'ruby::global': version => '1.9.3' }
  ruby::gem { "git-process for ruby 1.9.3":
    gem => 'git-process',
    ruby => '1.9.3',
    version => '~> 2.0'
  }

  include virtualbox
  include vagrant
  # vagrant::plugin { 'vagrant-vmware-fusion':
  #   license => 'puppet:///modules/people/joe/licenses/fusion.lic',
  # }
  # vagrant::box { 'Omega AEM 5.6 Base 20140107':
  #   source => 'http://10.143.47.12:8888/owncloud/public.php?service=files&t=910d7facc1f51c6767e0a5a2f391d5c1&download&path=/base_omega_56_20140107.box'
  # }

  class { 'intellij':
    edition => 'ultimate',
    version => '12.1.6'   # still requires a Java 6 runtime :-(
  }

  # Homebrew Packages
  package { [   #  "provider => homebrew, ensure => present," are assumed as defaults
      'gradle',
      'groovy',
      'jq',
      'tree',
      'wget'
    ]:
  }

  include sublime_text_2
  file { "${home}/bin":
     ensure => directory,
  }
  file { "${home}/bin/subl":
     ensure => 'link',
     target => '/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl',
     require => [ Package[SublimeText2], File["${home}/bin"] ]
  }
  ########################################
  # Sublime Text 2 Packages
  #   (initial set ranked by popularity: https://sublime.wbond.net/browse/popular )
  ########################################
  sublime_text_2::package { 'Package Control': source => 'wbond/sublime_package_control' }
  sublime_text_2::package { 'Emmet': source => 'sergeche/emmet-sublime' }
  sublime_text_2::package { 'Sublime Linter': source => 'SublimeLinter/SublimeLinter' }
  sublime_text_2::package { 'Git': source => 'kemayo/sublime-text-git' }
  # #Open Komodo [JavaScript, Mason, XBL, XUL, RHTML, SCSS, Python, HTML, Ruby, Python3, XML, Sass, XSLT, Django, HTML5, Perl, CSS, Twig, Less, Smarty, Node.js, Tcl, TemplateToolkit, PHP]
  # sublime_text_2::package { 'SublimeCodeIntel': source => 'SublimeCodeIntel/SublimeCodeIntel' }
  sublime_text_2::package { 'BracketHighlighter': source => 'facelessuser/BracketHighlighter' }
  # sublime_text_2::package { 'sublime-text-git': source => 'kemayo/sublime-text-git' }
  # sublime_text_2::package { 'Sass': source => 'russCloak/SublimePuppet' }
  # sublime_text_2::package { 'Tag': source => 'SublimeText/Tag' }
  sublime_text_2::package { 'IndentXML': source => 'alek-sys/sublimetext_indentxml' }
  sublime_text_2::package { 'Sublime-PrettyJson': source => 'dzhibas/SublimePrettyJson' }

  # Google Closure Linter
  exec { "gjslint":
    command => "easy_install http://closure-linter.googlecode.com/files/closure_linter-latest.tar.gz",
    creates => "/usr/local/bin/gjslint",
  }
}

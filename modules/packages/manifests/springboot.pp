# == Description
#
# A CLI for Spring Boot, a heavily convention-oriented way to create Spring applications.
#
# http://projects.spring.io/spring-boot/
#
class packages::springboot {
  homebrew::tap { 'pivotal/tap': }

  package { 'springboot':
    provider => 'homebrew',
  }

}

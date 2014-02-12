# Style Guide

In addition to the [standard Puppet style guidelines][style_guide], there are a few things that make working with Puppet easier in general, as well as Boxen and this project in particular.


## "Rules"

* Declare classes with `include 'classname'`, not `class { 'classname': ... }`
    * See the section below on [Hiera](#take-advantage-of-hiera-but-dont-go-crazy) for the reasons why, and how to configure the class definitions
* Minimize the use of anything other than `include` in your manifests
    * This encourages creating small, highly cohesive files that are much easier to read and highlight opportunities for code/manifest reuse
    * When combined with Hiera and class parameters, this allows for simple and flexible configuration of resources
* Run `rake lint` from the top-level
    * This will run [puppet-lint][puppet_lint] for all the modules of this repo
* Run `rake spec` in your modules
    * This currently has to be done in each module because my Rake-fu isn't good enough to do the recursion yet
    * See the section below on [Writing Tests](#writing-tests)
* Take advantage of the "[packages][packages]" module in this repository
    * Converting something like installing a program into a `Class` so `include` can easily be done by adding it to the "[packages][packages]" module
    * It's a great place to actively modify the class while developing, such as adding a package version parameter, source URL, application configuration settings, links, etc.
* Move things out of the "[packages][packages]" module as soon as it's stable
    * The normal [Puppet Librarian][puppet_librarian] mechanism is a much better way of handling modules/manifests that can be reused for other purposes and are not *directly* related to a person or project


## Take Advantage of Hiera (But Don't Go Crazy)

Hiera lets you think about your configurations in a data-driven way, which is a lot more natural. It also cleanly solves some sticky problems that happen in Puppet otherwise.

See the documentation on [how to configure Hiera][hiera_config] and [how it integrates with Puppet][hiera_puppet] for details on how it works.

### The Problem

One issue that often happens with a non-trivial collection of modules/manifests is duplicate declarations of Classes. To take a trivial example, if two different manifests declared:

```puppet
class { 'boxen::config':
    logdir => '/var/log/boxen',
}
```

then Puppet will complain when it compiles the catalog that the `boxen::config` class has been redeclared. Without Hiera, there are two solutions to this:

* Wrap at least one of the declarations in a `if !declared('boxen::config')` (or its equivalent, such as [stdlib][stdlib]'s `ensure_resource` function). Besides being a little messy, it also leaves open the door for semi-random configuration since then the parse-order matters if manifests used different parameters to the class.
* Use `include 'boxen::config` and Puppet will add the Class only if it has not already been declared using its defaults. However, without Hiera that suffers from two problems. First, there's no way to specify any parameters to the class so it has to use its defaults. Second, if there are any parameters without defaults, you can't use the class at all.

### The Solution

Using [Hiera's Puppet integration][hiera_puppet], you can have your manifests declare
```puppet
include 'boxen::config'
```
and in a Hiera data file (such as `common.yaml`) have
```yaml
---
boxen::config::logdir: '/var/log/boxen'
```
That has the added benefit of giving an opportunity to "hook" into its configuration even if a manifest/module tries to create the resource before your manifests have the opportunity since Hiera is always used (unless the parameter is specifically passed in).

The manifests are kept clean, clear, and configuration is guaranteed to be consistent.


## Writing Tests

Create tests to verify that each class is behaving correctly. At times it may seem a little silly since many tests will be asserting very simple conditions that are declared in the manifest. However it's very possible for unexpected combinations to occur when Puppet combines classes and builds its catalog, so it's best to lock that down.

The [people][people], [projects][projects] and [packages][packages] modules are all set up to use [rspec-puppet][rspec_puppet] and [Puppet Labs Spec Helper][puppetlabs_spec_helper]. (The [Boxen project][boxen_project] encourages the use of [Cardboard][cardboard], but that is both non-standard from how all other Puppet development is done, and less flexible than using [Rake][rake].)

Especially in a CI context, normally you would simply run `rake spec`, which makes sure all the dependencies/fixtures are ready before running the tests, then does cleanup. The problem is, it does the cleanup: when you're doing active development you don't want to download your external modules each and every time your run your tests. So a more realistic sequence is:
```bash
$ rake spec_prep
$ rake spec_standalone
  # develop develop develop
$ rake spec_standalone
  # develop develop develop
$ rake spec_standalone
  # develop develop develop
  # etc
```

A better [Rake][rake] developer would make it check for the existence of the fixtures and only run `spec_prep` when it's missing, include linting and syntax checking to running the tests, etc. But that hasn't happened yet...

[rake]: http://rake.rubyforge.org/
[cardboard]: https://github.com/boxen/cardboard/
[boxen_project]: https://github.com/boxen/puppet-boxen
[hiera_config]: http://docs.puppetlabs.com/hiera/1/configuring.html
[hiera_puppet]: http://docs.puppetlabs.com/hiera/1/puppet.html
[packages]: modules/packages/README.md
[people]: modules/people/README.md
[projects]: modules/projects/README.md
[puppet_librarian]: https://github.com/rodjek/librarian-puppet
[puppet_lint]: http://puppet-lint.com/
[stdlib]: https://github.com/puppetlabs/puppetlabs-stdlib
[style_guide]: http://docs.puppetlabs.com/guides/style_guide.html
[rspec_puppet]: http://rspec-puppet.com/
[puppetlabs_spec_helper]: https://github.com/puppetlabs/puppetlabs_spec_helper

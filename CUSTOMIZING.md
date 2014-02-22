# Customizing

You can always check out the number of existing modules we already
provide as optional installs under the
[boxen organization](https://github.com/boxen). These modules are all
tested to be compatible with Boxen. Use the `Puppetfile` to pull them
in dependencies automatically whenever `boxen` is run.

### Including boxen modules from github (boxen/puppet-<name>)

You must add the github information for your added Puppet module into your Puppetfile at the root of your
boxen repo (i.e., `/opt/boxen/repo/Puppetfile` ).

The function "github" is defined at the top of the Puppetfile
and takes the name of the module, the version, and optional repo location:

``` ruby
def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end
```

Now Puppet knows where to download the module from when you include it in your manifests.


### How Boxen interacts with Puppet

Boxen is broken out into two primary Puppet modules: "people" and "project." There is another helper module, "packages," that is meant for adapting things cleanly into Puppet classes.

When you first run Boxen, it asks for your GitHub.com username and then uses that as your unique identifier through the rest of the system. In the "people" module, it looks for a manifest with your name. See the [README in the "people" module](modules/people/README.md) for more information.

If you'd like to read more about how Puppet works, we recommend checking out [the official documentation](http://docs.puppetlabs.com/) for:

 * [Modules](http://docs.puppetlabs.com/learning/modules1.html#modules)
 * [Classes](http://docs.puppetlabs.com/learning/modules1.html#classes)
 * [Defined Types](http://docs.puppetlabs.com/learning/definedtypes.html)
 * [Facts](http://docs.puppetlabs.com/guides/custom_facts.html)


### Creating a personal module

See [the documentation in the
`modules/people`](modules/people/README.md)
directory for creating per-user modules that don't need to be applied
globally to everyone.


### Creating a 'project' module

See [the documentation in the
`modules/projects`](modules/projects/README.md)
directory for creating organization projects (i.e., repositories that people
will be working in).


### Creating a 'package' module

See [the documentation in the `modules/packages`](modules/packages/README.md) directory for creating Puppet classes for installing software. This is meant to be merely a convenience, and once things solidify the classes should be moved into their own modules. (See [Sharing Boxen Modules](#Sharing Boxen Modules).)

## Style Guide

**See the [Style Guide for this project](STYLE_GUIDE.md) for a lot more information!!**


## OS X Plists

Support for simple plist modifications is done via the built-in `boxen::osx_defaults`
module. For more sophisticated needs, such as hashes, arrays, dictionaries, etc. the
[Puppet Property List module](https://github.com/glarizza/puppet-property_list_key) has
been added.


## Binary packages

We support binary packaging for everything in Homebrew, rbenv, and nvm.
See `config/boxen.rb` for the environment variables to define.


## Sharing Boxen Modules

If you've got a Boxen module you'd like to be grouped under the Boxen org,
(so it can easily be found by others), please file an issue on this
repository with a link to your module.

We'll review the code briefly, and if things look pretty all right,
we'll fork it under the Boxen org and give you read+write access to our
fork.

You'll still be the maintainer, you'll still own the issues and PRs.
It'll just be listed under the boxen org so folks can find it more easily.


## Integrating with Github Enterprise

If you're using a Github Enterprise instance rather than github.com,
you will need to set the `BOXEN_GITHUB_ENTERPRISE_URL` and
`BOXEN_REPO_URL_TEMPLATE` variables in your
[Boxen config](config/boxen.rb).

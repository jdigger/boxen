# Personal Manifests

Per-user manifests live in `modules/people/manifests/${login}.pp`, where
`$login` is a GitHub login.

To modularize further for a single user, create a subdirectory with the
login name and put the additional manifests in there.


## Hiera

Hiera data is also supported per-user and per-project.

See [`/opt/boxen/repo/config/hiera.yaml`](../../config/hiera.yaml) for the specifics.

**A LOT OF CONFIGURATION IS DONE VIA HIERA** so it is worth understanding how that works.


## Facter Facts

If you have private information that you want Boxen to manage but don't want to
check into this public repo (e.g., passwords, OAuth tokens, SSH config), add them
as key-value "facts" in `~/.boxen/config.json` and manage that securely seperately
(Dropbox, a USB key, etc).

An example `~/.boxen/config.json` file
```json
{
  "github_api_token": "xxxxxxxxxxxxxxxxxxxxxxxxx",
  "boxen_project_01": "omega",
  "boxen_project_02": "developer"
}
```

The "github_api_token" will now be available to manifests and templates. Also, both the "omega" and "developer" projects will be applied, and Hiera settings in "omega" will take precidence over settings in "developer."


## Files

Personal (but non-private!) files like your `.zshrc` that you want managed should go in
`modules/people/files/${login}/`.

An example of referencing from a manifest:

```puppet
$home = "/Users/${::boxen_user}"

file { "${home}/.zshrc":
  ensure  => 'present',
  source  => "puppet:///modules/people/jdigger/zshrc",
}
```


## Templates

Personal files that you want to do variable substitution on (such as to insert needed private information that is stored in `~/.boxen/config.json`) should go in `modules/people/templates/${login}/`.

An example of referencing from a manifest:

```puppet
$home = "/Users/${::boxen_user}"

file { "${home}/.zshenv":
  ensure  => 'present',
  content => template('people/jdigger/zshenv.erb')
}
```


## User Names

Note that if your GitHub username contains dashes, you should replace them by underscores in both the manifest name and the class name.


## Projects

As described earlier, projects are included by setting a "fact" using the "::boxen_project_##" names. See also [the "projects" module](../projects/README.md).

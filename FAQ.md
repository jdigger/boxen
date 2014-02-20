# Frequently Asked Questions

## "Device not configured" when cloning from a private repo

This happens if `boxen-git-credential` does not yet know your password (from the osx-keychain). The easiest fix, for now, is to check out a private repo from that server "manually" so the password gets stored in the osx-keychain.


## Updates / Versioning / Uninstalling

The OS X packaging providers are, in general, incredibly "limited."

| Provider       | Uninstall | Versionable | Updatable |
|:---------------|:---------:|:-----------:|:---------:|
| appdmg         |           |             |           |
| appdmg_eula    |           |             |           |
| compressed_app |     Y     |             |           |
| compressed_pkg |           |             |           |
| homebrew       |     Y     |       Y     |     Y     |
| macports       |     Y     |       Y     |     Y     |
| pkgdmg         |           |             |           |

For all the providers other than "homebrew" and "macports", the fact that a package is installed is tracked in `/var/db/.puppet_{provider}_installed_{package_name}`.

What that means is that to reinstall a package by the non-versionable providers, you must *delete* the file in `/var/db/` before trying to install it again.


## More

See [FAQ](https://github.com/boxen/our-boxen/blob/master/docs/faq.md).

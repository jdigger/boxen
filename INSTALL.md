# Installation

To give you a brief overview, we're going to:

* Install dependencies (basically Xcode)
* Bootstrap a boxen for your self/team/org/company
* Then convert your local copy of that boxen to the post-bootstrapped version

There are a few potential conflicts to keep in mind.
Boxen does its best not to get in the way of a dirty system,
but you should check into the following before attempting to install your
boxen on any machine (we do some checks before every Boxen run to try
and detect most of these and tell you anyway):

* Boxen __requires__ at least the Xcode Command Line Tools installed.
* Boxen __will not__ work with an existing rvm install.
* Boxen __may not__ play nice with a GitHub username that includes dash(-)
* Boxen __may not__ play nice with an existing rbenv install.
* Boxen __may not__ play nice with an existing chruby install.
* Boxen __may not__ play nice with an existing homebrew install.
* Boxen __may not__ play nice with an existing nvm install.
* Boxen __recommends__ installing the full Xcode.


### Dependencies

**Install the Xcode Command Lines Tools and/or full Xcode.**
This will grant you the most predictable behavior in building apps like
MacVim.

How do you do it?


#### OS X 10.9 (Mavericks)

**Note**
If you are creating a fresh install on Xcode 5.1 there is a clang issue with
certain Ruby Gems. There is a Stackoverflow post [here](http://stackoverflow.com/questions/22352838/ruby-gem-install-json-fails-on-mavericks-and-xcode-5-1-unknown-argument-mul)

To run the Boxen script follow these instructions
```
cd /opt/boxen/repo
ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future ./script/boxen
```

#### OS X < 10.9

1. Install Xcode from the Mac App Store.
1. Open Xcode.
1. Open the Preferences window (`Cmd-,`).
1. Go to the Downloads tab.
1. Install the Command Line Tools.


### Distributing

``` sh
sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
git clone https://github.com/jdigger/boxen.git /opt/boxen/repo
cd /opt/boxen/repo
./script/boxen-bootstrap
./script/boxen --no-fde
```

Keep in mind the bootstrap boxen encourages full disk encryption, which will conflict
with the PGP full disk encryption installed by TWC.  Thus, the  `--no-fde`.

It should run successfully, and should tell you to source a shell script
in your environment.

For users without a bash or zsh config or a `~/.profile` file,
Boxen will create a shim for you that will work correctly.
If you do have a `~/.bashrc` or `~/.zshrc`, your shell probably will not use
`~/.profile` so you'll need to add a line like so at _the end of your config_:

``` sh
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
```

Once your shell is ready, open a new tab/window in your Terminal
and you should be able to successfully run `/opt/boxen/repo/script/boxen --env`.
If that runs cleanly, you're in good shape.

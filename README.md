dotfiles
========

My configuration files for unix-like places of worship.

``` bash
$ git clone git@github.com:jvarsoke/dotfiles.git ~/.dotfiles

$ ~/.dotfiles/bootstrap.sh

```

## What to expect
In short, not much.  This is a first forray into organization of something built up over years of unixing.

## Okay, but what does it do?
Bootstrap makes links of all ".dot" files in ~/.dotfiles to $HOME for all files in ~/.dotfiles root.
For non ".dot" directories, bootstrap will link the files inside the directory to the ~/directory.
Bootstrap should no-clobber and report any existing files that get in its way.

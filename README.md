dotfiles
========

My configuration files for unix-like places of worship.

``` bash
$ git clone git@github.com:jvarsoke/dotfiles.git ~/.dotfiles

```
If you receive:
``` bash
Permission denied (publickey).
fatal: The remote end hung up unexpectedly
```
You need to add your ssh key to github (https://help.github.com/articles/generating-ssh-keys)

Once that is taken care of re-run the git clone and do this:
``` bash

$ ~/.dotfiles/bootstrap.sh
$  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

inside VIM
```
: BundleInstall

```

## What to expect
In short, not much.  This is a first forray into organization of something built up over years of unixing.

## Okay, but what does it do?
Bootstrap makes links of all ".dot" files in ~/.dotfiles to $HOME for all files in ~/.dotfiles root.
For non ".dot" directories, bootstrap will link the files inside the directory to the ~/directory.
Bootstrap should no-clobber and report any existing files that get in its way.

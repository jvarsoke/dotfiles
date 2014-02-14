dotfiles
========

My configuration files for unix-like places of worship.

``` bash
$ git clone git@github.com:jvarsoke/dotfiles.git ~/.dotfiles

#then link everything manually -- for now

```

## What to expect
In short, not much.  This is a first forray into organization of something built up over years of unixing.

## TODO
List of requirements I'd like this to fulfill:

### Bootstrap
- Bootstrap should create all symlinks
#### Symlinks
- All symlinks are to $HOME
- Files symed to $HOME might be in sub-dirs for organization
- All symed files get a .dot in front
- Do directories?
	.vim does,
	bin does not
- bashrc should be split into init.d type runfiles
- Should they go in subject-related directories?
- If so, the would be slower to read (find)

### Exceptions
- Sensitive info should be off-book
- remove passwords
- make local.variables to support things like Cygwin

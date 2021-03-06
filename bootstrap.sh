#!/usr/bin/env bash

# Bootstrap the dotfiles, making symlinks etc

# get directory of where this script is installed (.dotfiles)
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until no longer a symlink
	DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
	SOURCE="$(readlink "$SOURCE")"
	# if $SOURCE was a relative symlink, we need to resolve it
	# relative to the path where the symlink file was located
	[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DOTFILES="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

[[ ! -d $DOTFILES ]] && echo "Couldn't figure out the dotfiles directory" && exit 1

pushd $DOTFILES > /dev/null

shopt -s extglob
shopt -s nullglob
shopt -s globstar
folders=(**/)
shopt -s dotglob
links=(.!(.||*swp|gitignore|git))

# do_usage ------------------------------------------------------------------
function do_usage() {
	echo "Usage: $0 [install|update|test|clean]"
}

# do_test -------------------------------------------------------------------
# tests whether common tools are installed
function do_test() {
	test_dependencies
	[ hash ack 2>/dev/null ] && echo "ack: not found (http://beyondgrep.com/install/)"
	[ hash ant 2>/dev/null ] && echo "ant: couldn't find Ant in path"
	[ hash mvn 2>/dev/null ] && echo "mvn: couldn't find Maven in path"
	[ hash lein 2>/dev/null ] && echo "lein: install leiningen (http://leiningen.org/)"
	[ hash xmllint 2>/dev/null ] && echo "xmllint: not found (libxml2-utils package)"
	[ hash tmux 2>/dev/null ] && echo "tmux: not found"
}

# do_install ----------------------------------------------------------------
function do_install() {
	test_dependencies
	setup_links
	setup_folders
}

function test_dependencies() {
	[ hash tset 2>/dev/null ] && echo "No tset: maybe install ncurses (cygwin)?"
	[ hash column 2>/dev/null ] && echo "No column: install util-linux (cygwin)?"
}

function setup_links() {
	#echo "Install Links ${links[@]}"
	for s in ${links[@]}; do
		src=$DOTFILES/${s}
		tgt=$HOME/${s}
		if [ ! -e $src ] ; then
			echo "Warning: Couldn't find src file: $src, skipping"
		elif [ -L $tgt ] ; then
			lnk=`readlink -f $tgt`
			if [ ! $lnk == $src ] ; then
				echo "Skipping: $tgt linked to $lnk not $src"
			else
				[[ $VERBOSE ]] && echo "Skipping: $tgt already linked to $lnk"
			fi
		elif [ -f $tgt ] ; then
			echo "Skipping: Real file already exists: $tgt"
		else
			ln -s $src $tgt
		fi
	done
}

function setup_folders() {
	#echo "Installing files in folders: ${folders[@]}"
	for d in ${folders[@]}; do
		d=${d%?}
		files=($d/!(*swp|.gitignore|core))
		for s in ${files[@]}; do
			src=$DOTFILES/${s}
			tgt=$HOME/${s}
			if [ ! -e $src ] ; then
				echo "Warning: Couldn't find src file: $src, skipping"
			elif [ -L $tgt ] ; then
				lnk=`readlink -f $tgt`
				if [ ! $lnk == $src ] ; then
					echo "Skipping: $tgt linked to $lnk not $src"
				else
					[[ $VERBOSE ]] && echo "Skipping: $tgt already linked to $lnk"
				fi
			elif [ -f $tgt ] ; then
				echo "Skipping: File already exists: $tgt"
			else
				if [ -f "$HOME/$d" ] ; then
					echo "Error: non-directory file $HOME/$d exists"
				else
					if [ ! -d "$HOME/$d" ] ; then
						mkdir -p $HOME/$d
					fi
					ln -s $src $tgt
				fi
			fi
		done
	done
}

# do_clean ------------------------------------------------------------------
#cleanup an install of .dotfiles (removing all the symlinks)
function do_clean() {
	echo "TODO: clean"
}

# Main ----------------------------------------------------------------------
case "$1" in
	install|"")
		do_install
		;;
	clean)
		do_clean
		;;
	test)
		do_test
		;;
	update)
		echo "Update not available yet";
		;;
	*)
		do_usage
		exit 3
		;;
esac

popd > /dev/null

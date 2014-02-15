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
	echo "Usage: $0 [install|update|clean]"
}

# do_install ----------------------------------------------------------------
function do_install() {
	#list of files we want to symlink with a leading dot
	#setup_links
	setup_folders
}

function setup_links() {
	echo "Install Links ${links[@]}"
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
			echo "Skipping: File already exists: $tgt"
		else
			echo "ln -s $src $tgt"
		fi
	done
}

function setup_folders() {
	echo "Installing files in folders: ${folders[@]}"
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
				elif [ ! -d "$HOME/$d" ] ; then
					echo "Making $HOME/$d"
				fi
				echo "ln -s $src $tgt"
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
	update)
		echo "Update not available yet";
		;;
	*)
		do_usage
		exit 3
		;;
esac


popd > /dev/null








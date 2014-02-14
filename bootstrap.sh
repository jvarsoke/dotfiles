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
DDIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

[[ ! -d $DDIR ]] && echo "Couldn't figure out the dotfiles directory" && exit 1

HDIR=${1:-$HOME}

pushd $HDIR > /dev/null

#list of files we want to symlink with a leading dot
#TODO: make this automagic
dot_sym_files=(vim vim/vimrc)

for s in ${dot_sym_files[@]}; do
	skip=false
	src=$DDIR/${s}
	tgt=$HDIR/"."${s}
	[ ! -e $src ] && skip=true && echo "Couldn't find src file: " $src 
	[ -e $tgt ] && skip=true && echo "File already exists: " $tgt
	if [ ! $skip ]; then
		echo "ln -s $src $tgt"
	fi
done

popd > /dev/null








#!/bin/bash
# Bash knows 3 diferent shells: normal shell, interactive shell, login shell.
# ~/.bashrc is read for interactive shells and ~/.profile is read for login
# shells. We just let ~/.profile also read ~/.bashrc and put everything in
# ~/.bashrc.

if `tty -s`; then
    mesg n
fi

ulimit -c 9999999

test -z "$PROFILEREAD" && . /etc/profile

# commands common to all logins
if ! [ $TERM ] ; then
    eval `tset -s -Q`
    case $TERM in
      con*|vt100) tset -Q -e ^?
        ;;
    esac
fi

#encourage xterms to announce their colors
if [ "$COLORTERM" == "gnome-terminal" ] || [ "$COLORTERM" == "xfce4-terminal" ]
then
	TERM=xterm-256color
elif [ "$COLORTERM" == "rxvt-xpm" ]
then 
	TERM=rxvt-256color
fi

#
# nearly no known program needs $TERMCAP - 'Slang'-programs get confused
# with a set $TERMCAP -> unset it.
# unset TERMCAP

# Some programs support several languages for their output.
# If you want them to use german, please uncomment the following line.
#export LANG=de_DE.ISO-8859-1

umask 022

#history -c

##source all the files in the bash directory that are .sh
for file in $HOME/.bashrc.d/*.sh; do
	source "$file"
done

##source all the files in the bash directory that are .sh
for file in $HOME/.bashrc.d/local/*.sh; do
	source "$file"
done

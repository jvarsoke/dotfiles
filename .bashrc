#!/bin/bash
# Bash knows 3 diferent shells: normal shell, interactive shell, login shell.
# ~/.bashrc is read for interactive shells and ~/.profile is read for login
# shells. We just let ~/.profile also read ~/.bashrc and put everything in
# ~/.bashrc.

ulimit -c 9999999

test -z "$PROFILEREAD" && . /etc/profile

#alias vi="vim -c \"normal '0'\""

# commands common to all logins
if ! [ $TERM ] ; then
    eval `tset -s -Q`
    case $TERM in
      con*|vt100) tset -Q -e ^?
        ;;
    esac
fi
#export TERM=rxvt-unicode-256color

#encourage xterms to announce their colors
if [ "$COLORTERM" == "gnome-terminal" ] || [ "$COLORTERM" == "xfce4-terminal"]
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

##variables
export PS1="\h% "
unset  MAILCHECK
export MAILCHECK
export LESS='-IEX'
export EDITOR='vim'
export SVN_EDITOR=vim
export DISPLAY PS2
export MAIL='/home/jvarsoke/mail/INBOX'
export PAGER='less'

##libraries

LD_LIBRARY_PATH="/usr/lib"
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/sane"
export LD_LIBRARY_PATH

##path
PATH="$HOME/bin"
PATH="$PATH:$HOME/apl/scid/scid-4.3"

PATH="$PATH:/bin"
PATH="$PATH:/usr/bin"
PATH="$PATH:/sbin"
PATH="$PATH:/usr/sbin"
PATH="$PATH:/usr/local/bin"
PATH="$PATH:/usr/X11R6/bin"
PATH="$PATH:/usr/games"
PATH="$PATH:/usr/local/nvu"

##ActionScript3
PATH=$PATH:/home/jvarsoke/apl/as3/bin
PATH=$PATH:/home/jvarsoke/apl/as3/runtimes/player/11.1/lnx
##java
#export JAVA_HOME="/usr/local/jdk"
#export JDK_HOME="/usr/local/jdk"

#PATH="$PATH:/usr/local/jdk/bin"          #jdk current version
#PATH="$PATH:/usr/local/j2sdkee1.2.1/bin" #java enterprise edition
PATH="$PATH:/usr/local/ant/bin"          #ant builder
PATH="$PATH:/usr/local/eclipse"          #eclipse

##java aps
export ANT_HOME="/usr/local/ant"
export JUNIT_HOME="/usr/share/java"
export XALAN_HOME="/usr/share/java"
export XERCES_HOME="/usr/share/java"
export CLOVER_HOME="/home/jvarsoke/lib/clover/clover-ant-1.3.13/lib"

CLASSPATH="."
CLASSPATH="$CLASSPATH:$HOME/lib/java"
CLASSPATH="$CLASSPATH:$HOME/lib/java/timesealing.jar"
CLASSPATH="$CLASSPATH:$JUNIT_HOME/junit.jar"
CLASSPATH="$CLASSPATH:$JUNIT_HOME/junit.jar"
CLASSPATH="$CLASSPATH:$CLOVER_HOME/clover.jar"
#CLASSPATH="$CLASSPATH:$XALAN_HOME/bin/xalan.jar"
#CLASSPATH="$CLASSPATH:$XALAN_HOME/bin/xml-apis.jar"
#CLASSPATH="$CLASSPATH:$XALAN_HOME/bin.xercesImpl.jar"

#CLASSPATH="$CLASSPATH:$XALAN_HOME/bin/bsf.jar"
#CLASSPATH="$CLASSPATH:$XERCES_HOME/xercesSamples.jar"
#CLASSPATH="$CLASSPATH:$XERCES_HOME/xercesImpl.jar"
CLASSPATH="$CLASSPATH:$HOME/lib/java/mysql-connector-java-3.0.8-stable-bin.jar"
#CLASSPATH="$CLASSPATH:/usr/local/jwsdp/common"
#CLASSPATH="$CLASSPATH:/usr/local/j2sdkee1.2.1/lib/j2ee.jar"   ##Enterprise Beans
export CLASSPATH
#alias xmltrans='java org.apache.xalan.xslt.Process'
XALAN="/usr/local/xalan/bin"
alias xmltrans='java -Xbootclasspath/p:$XALAN/xalan.jar:$XALAN/xml-apis.jar:$XALAN/xercesImpl.jar org.apache.xalan.xslt.Process'

#mk() { eval ${1:-MKPWD}=\`pwd`\; } 
#rt() { eval cd \\$${1:-MKPWD}\;pwd; }

##CVS
export CVSROOT="/usr/local/cvsroot"
export CVS_RSH="ssh"
alias cvsictk="cvs -z3 -d:ext:jvarsoke@cvs.ictk.sourceforge.net:/cvsroot/ictk"
alias cvsictkanon="cvs -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/ictk"

##aliases
alias ls='ls -F --color=auto'
alias from='egrep "^From:" /var/spool/mail/jvarsoke'
alias cls='ls -la ~'
alias f='finger'
alias ducks='du -cks * | sort -rn | head -11'
alias xv='xzgv'


##Java Aliases
alias jc='javac -d ~/lib/java'
alias jcc='javac *.java'
alias jcv='javac -verbose \!*.java |& grep -v "classes.zip"'
alias jcd='javac -deprecation \!.java'
#alias jj='echo "java: compiling \!*" \
#              && jc \!*                     \
#              && echo "java: running \!*"   \
#              && java \!*'
alias jj='java'
alias jjd='echo "java: compiling w/ deprecation \!*" \
              && jcd \!*                     \
              && echo "java: running \!*"   \
              && java \!*'
alias jja='echo "java: compiling \!*" \
              && jcd \!*                     \
              && echo "java: running in appletviewer\!*"   \
              && appletviewer \!*.html'
alias vj='vi \!*.java'
alias jvc='cd ~/src/java/txchess'
alias txc='pushd ~/src/java/txchess'
alias ictk='pushd ~/src/java/ictk'
alias ictks='pushd ~/src/java/ictk/src/ictk'
alias ictksb='pushd ~/src/java/ictk/src/ictk/boardgame'
alias ictknet='pushd ~/src/java/ictk/src/ictk/boardgame/chess/net'
alias ictkevt='pushd ~/src/java/ictk/src/ictk/boardgame/chess/net/ics/event'
alias ictkssh='ssh jvarsoke@shell.sourceforge.net'
alias ictkftp='sftp jvarsoke@shell.sourceforge.net:/home/groups/i/ic/ictk/htdocs'
alias as='pushd ~/src/java/autoSENSEI/src/autosensei'
#alias ss='cd $(pwd | sed "s/test\/ictk/src\/ictk/")'

alias nethack='/usr/games/nethack'
#alias slashem='/usr/games/slashem'

XBOARD_SIZE='small'

OLDFICS=64.71.131.140
FICS=69.36.243.188
ICC=207.99.83.228

alias fics='export TERM=xterm-color && xboard -ics -icshost $FICS -icshelper timeseal -icsinput -autoflag -animate -coords -xexit -colorize -icslogon ~/.icsrc/fics.rc -size $XBOARD_SIZE'

alias ficss='export TERM=xterm-color && xboard -ics -icshost $FICS -icshelper timeseal -icsinput -autoflag -animate -coords -xexit -colorize -icslogon ~/.icsrc/stadjak.rc -size $XBOARD_SIZE'

alias ficso='export TERM=xterm-color && xboard -ics -icshost $FICS -icshelper timeseal -icsinput -autoflag -animate -coords -xexit -colorize -icslogon ~/.icsrc/fics.rc -size tiny'

alias ficsc='export TERM=xterm-color && xboard -ics -icshost $FICS -icshelper timeseal -icsinput -autoflag -animate -coords -xexit -colorize -icslogon ~/.icsrc/cyber.rc '

alias ficsz='export TERM=xterm-color && xboard -ics -icshost $FICS -icshelper timeseal -icsinput -autoflag -animate -coords -xexit -colorize -size tiny -icslogon ~/.icsrc/zug.rc'

alias tmb='export TERM=xterm-color && xboard -ics -icshost $FICS -icshelper timeseal -icsinput -autoflag -animate -coords -xexit -colorize -size tiny -icslogon ~/.icsrc/tmb.rc'

alias ficsg='export TERM=xterm-color && xboard -ics -icshost $FICS -icshelper timeseal -icsinput -autoflag -animate -coords -xexit -colorize -icslogon ~/.icsrc/guest.rc -size petite'

alias ficsx='export TERM=xterm-color && xboard -ics -icshost $FICS -icshelper timeseal -icsinput -autoflag -animate -coords -xexit -colorize -icslogon ~/.icsrc/guest2.rc -size petite'

alias icc='export TERM=xterm-color && xboard -ics -icshost $ICC -icshelper timestamp -icsinput -autoflag -animate -coords -xexit -colorize -icslogon ~/.icsrc/icc.rc -size petite' 

alias iccg='export TERM=xterm-color && xboard -ics -icshost $ICC -icshelper timestamp -icsinput -autoflag -animate -coords -xexit -colorize -icslogon ~/.icsrc/iccg.rc -size petite' 

alias ocl='export TERM=xterm-color && xboard -ics -icshost $ICC -icshelper timestamp -icsinput -autoflag -animate -coords -xexit -colorize -icslogon ~/.icsrc/ocl.rc'

alias dncs='export TERM=xterm-color && xboard -ics -icshost 63.169.164.202 -icsinput -autoflag -animate -coords -xexit -colorize -icslogon ~/.icsrc/dncs.rc'

alias chessd='export TERM=xterm-color && xboard -ics -icshost 127.0.0.1 -icsinput -autoflag -animate -coords -xexit -colorize -icslogon ~/.icsrc/chessd.rc '

alias accu='accuclock -p 4909 &'

alias chessnet='export TERM=xterm-color && xboard -ics -icshost localhost -icsport 4909 -icsinput -autoflag -animate -coords -xexit -colorize -icslogon ~/.icsrc/chessnet.rc'

alias xb='xboard -fcp "crafty" -fd /usr/share/crafty -coords -animate'
alias gGo='java -jar bin/gGo.jar'

alias txchess='java -jar ~/bin/TxChess.jar -d'

#alias gmplayer='mplayer -gui -vo x11 -ao alsa5'

alias xacct='pushd ~/src/java/xacct'

alias board='pushd ~/src/java/com/jvarsoke/boardgame'

alias xlock='xscreensaver-command -lock'
alias dvd='mplayer -framedrop dvd://1'

##for edonkey
export PKG_CONFIG=/usr/bin/pkg-config
export PKG_CONFIG_PATH=/usr/lib/pkgconfig

##bogus for ed2k
export GDM_DESKTOP_SESSION_ID=23
##clear history
history -c

##work around for pgnenvelope
export PERLIO=stdio
alias pine2mutt='pine2mutt ~/.addressbook > ~/.mutt/aliases_pine'
alias ss='ssh shadowbox'
alias sss='ssh -p 443 shadowbox.no-ip.org'
alias gnucash_irc='bitchx irc.gnome.org'
alias dfirc='bitchx irc.newnet.net'

alias phil='pushd ~/docs/class/uva/phil/crit*'

alias rkol='mplayer http://www.radio-kol.net/64/listen.pls'
#alias difm='mplayer http://www.di.fm/mp3/classictechno.pls'
alias difm='mplayer http://u17.di.fm:80/di_trance'
#alias goa='mplayer http://www.di.fm/mp3/goapsy.pls'
alias goa='mplayer http://u17.di.fm:80/di_goapsy'
alias djmix='mplayer http://u12.di.fm:80/di_djmixes'
alias dihouse='mplayer http://u16.di.fm:80/di_house'
alias dihardcore='mplayer http://u16.di.fm:80/di_hardcore'
alias diprogressive='mplayer http://u16.di.fm:80/di_progressive'
alias noa='telnet nethack.alt.org'
alias starcraft='wine ~/.wine/drive_c/Program\ Files/Starcraft/StarCraft.exe'
#alias steam='wine ~/.wine/drive_c/Program\ Files/Steam/Steam.exe'
alias ta='wine ~/.wine/drive_c/Program\ Files/GOG.com/Total\ Annihilation/TotalA.exe'
alias fallout='(cd ~/.wine/drive_c/Program\ Files/GOG.com/Fallout/ && wine falloutw.exe)'
alias fallout2='(cd ~/.wine/drive_c/Program\ Files/GOG.com/Fallout\ 2/ && wine fallout2.exe)'
alias ja2='(cd ~/.wine/drive_c/Program\ Files/GOG.com/Jagged\ Alliance\ 2/ && wine ja2.exe)'
alias toee='(cd ~/.wine/drive_c/Program\ Files/GOG.com/Temple\ of\ Elemental\ Evil/ && wine ToEE.exe)'
alias pandora="pianobar"
alias chrome='gnome-www-browser'
alias fritz='wine .wine/drive_c/Program\ Files/ChessBase/ChessProgram8/ChessProgram8.exe'
alias chessbase='wine .wine/drive_c/Program\ Files/ChessBase/ChessBase\ 8.0\ Proto/C8.exe'
export GIT_PAGER=cat

function calc
{
        echo "scale=2 ; $*" | sed -e "s:x:*:g" | sed -e "s:,::g" | bc
}
alias minecraft="java -jar ~/bin/Minecraft.jar"
alias sts="/opt/springsource/sts-2.9.0.RELEASE/STS"

##source all the files in the bash directory that are .sh
for file in ~/.bashrc.d/*.sh; do
	source "$file"
done

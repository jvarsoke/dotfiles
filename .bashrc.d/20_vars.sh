#!/bin/bash

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
export GIT_PAGER=cat


##OS-Specific: Linux
if [ "$OSTYPE" = "linux-gnu" ]; then
    :
elif [ "$OSTYPE" = "cygwin" ]; then
    PYTHON_HOME='/cygdrive/c/Users/jvarsoke/AppData/Local/Programs/Python/Python36/'
else
    echo "Unknown OS Type = '$OSTYPE'"
fi



##libraries
LD_LIBRARY_PATH="/usr/lib"
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/sane"
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu"

##path
PATH="$HOME/bin"

PATH=$PATH:$PYTHON_HOME

PATH="$PATH:/bin"
PATH="$PATH:/usr/bin"
PATH="$PATH:/sbin"
PATH="$PATH:/usr/sbin"
PATH="$PATH:/usr/local/bin"
PATH="$PATH:/usr/X11R6/bin"
PATH="$PATH:/usr/games"
PATH="$PATH:/usr/local/nvu"
PATH="$PATH:$HOME/apl/android-studio/bin"
PATH="$PATH:$HOME/apl/scid/scid-4.3"

##ActionScript3
PATH=$PATH:/home/jvarsoke/apl/as3/bin
PATH=$PATH:/home/jvarsoke/apl/as3/runtimes/player/11.1/lnx
##java
#export JAVA_HOME="/usr/local/jdk"
#export JDK_HOME="/usr/local/jdk"

#PATH="$PATH:/usr/local/jdk/bin"          #jdk current version
#PATH="$PATH:/usr/local/j2sdkee1.2.1/bin" #java enterprise edition
#PATH="$PATH:/usr/local/ant/bin"          #ant builder
#PATH="$PATH:/usr/local/eclipse"          #eclipse

##java aps
#export ANT_HOME="/usr/local/ant"
export JUNIT_HOME="$HOME/lib/java/junit"
#export XALAN_HOME="/usr/share/java"
#export XERCES_HOME="/usr/share/java"
export CLOVER_HOME="$HOME/lib/clover/clover-ant-3.2.2/lib"

CLASSPATH="."
CLASSPATH="$CLASSPATH:$HOME/lib/java"
#CLASSPATH="$CLASSPATH:$HOME/lib/ictk"
CLASSPATH="$CLASSPATH:$HOME/lib/java/timesealing.jar"
CLASSPATH="$CLASSPATH:$JUNIT_HOME/junit.jar"
CLASSPATH="$CLASSPATH:$CLOVER_HOME/clover.jar"
#CLASSPATH="$CLASSPATH:$XALAN_HOME/bin/xalan.jar"
#CLASSPATH="$CLASSPATH:$XALAN_HOME/bin/xml-apis.jar"
#CLASSPATH="$CLASSPATH:$XALAN_HOME/bin.xercesImpl.jar"

#CLASSPATH="$CLASSPATH:$XALAN_HOME/bin/bsf.jar"
#CLASSPATH="$CLASSPATH:$XERCES_HOME/xercesSamples.jar"
#CLASSPATH="$CLASSPATH:$XERCES_HOME/xercesImpl.jar"
#CLASSPATH="$CLASSPATH:$HOME/lib/java/mysql-connector-java-3.0.8-stable-bin.jar"
#CLASSPATH="$CLASSPATH:/usr/local/jwsdp/common"
#CLASSPATH="$CLASSPATH:/usr/local/j2sdkee1.2.1/lib/j2ee.jar"   ##Enterprise Beans

#alias xmltrans='java org.apache.xalan.xslt.Process'
#XALAN="/usr/local/xalan/bin"
#alias xmltrans='java -Xbootclasspath/p:$XALAN/xalan.jar:$XALAN/xml-apis.jar:$XALAN/xercesImpl.jar org.apache.xalan.xslt.Process'

#mk() { eval ${1:-MKPWD}=\`pwd`\; } 
#rt() { eval cd \\$${1:-MKPWD}\;pwd; }

##CVS
export CVSROOT="/usr/local/cvsroot"
export CVS_RSH="ssh"

function calc
{
        echo "scale=2 ; $*" | sed -e "s:x:*:g" | sed -e "s:,::g" | bc
}

if hash lesspipe 2>/dev/null ; then
    eval $(lesspipe)
else
    :
fi


export PATH
export CLASSPATH
export LD_LIBRARY_PATH

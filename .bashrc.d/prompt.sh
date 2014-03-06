# prompt

colors=$(tput colors)

#if (($colors >= 256)) ; then
	: #echo "got colors"
#fi

# ANSI CODES - SEPARATE MULTIPLE VALUES WITH ;
#
# single color: "\[\e[0;##m\]"
#
#  0  reset          4  underline
#  1  bold           7  inverse
#
# FG  BG  COLOR     FG  BG  COLOR
# 30  40  black     34  44  blue
# 31  41  red       35  45  magenta
# 32  42  green     36  46  cyan
# 33  43  yellow    37  47  white


# Exit code of previous command.
function prompt_exitcode() {
  [[ $1 != 0 ]] && echo "<$1>"
}

# git status ---------------------------------------------------------------
function prompt_git() {
  #bail if we don't have git installed
  if ! hash git 2> /dev/null ; then
	  return 1
  fi
  local status output flags
  status="$(git status 2>/dev/null)"
  [[ $? != 0 ]] && return;
  output="$(echo "$status" | awk '/Initial commit/ {print "(init)"}')"
  [[ "$output" ]] || output="$(echo "$status" | awk '/On branch/ {print $4}')"
  [[ "$output" ]] || output="$(git branch | perl -ne '/^\* (.*)/ && print $1')"
  flags="$(
    echo "$status" | awk 'BEGIN {r=""} \
      /^Changes to be committed:$/        {r=r "+"}\
      /^Changes not staged for commit:$/  {r=r "!"}\
      /^Untracked files:$/                {r=r "?"}\
      END {print r}'
  )"
  if [[ "$flags" ]]; then
    output="$output:$flags"
  fi
  echo "[$output] "
}

# svn status ----------------------------------------------------------------
function prompt_svn() {
  #bail if we don't have git installed
  if ! hash svn 2> /dev/null ; then
	  return 1
  fi

  local info="$(svn info . 2> /dev/null)"
  local last current
  if [[ "$info" ]]; then
    last="$(echo "$info" | awk '/Last Changed Rev:/ {print $4}')"
    current="$(echo "$info" | awk '/Revision:/ {print $2}')"
    echo "[$last:$current] "
  fi
}

# setup prompt ---------------------------------------------------------------
function prompt_command() {
  local exit_code=$?
  PS1=""
  case $TERM in 
	  xterm*)
		  PS1="\[\033]0;\u@\h: \w\007\]"
		  ;;
  esac
  # svn: [repo:lastchanged]
  PS1="$PS1$(prompt_svn)"
  # git: [branch:flags]
  PS1="$PS1$(prompt_git)"
  # path: [user@host:path]
  PS1="$PS1\h"
  # exit code: 127
  PS1="$PS1$(prompt_exitcode "$exit_code")"
  PS1="$PS1% "
}


#if [ "$SSH_TTY" ] ; then
#	echo foo
	#do something later
#fi

PROMPT_COMMAND="prompt_command"

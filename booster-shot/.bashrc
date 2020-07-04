# =============================================================================================
#
# Author: Noah Castetter (edit of .bashrc that comes with gitbash)
# Created: 5-22-2020
# Edited: 5-22-2020
# Version: 0
#
# Description: When used as .bashrc will give acces to programs which speed up workflow. First
# of which is MHPD.
# =============================================================================================

# $Id: .bashrc,v 1.2 1998/05/02 21:42:35 amos Exp $
# Individual per-interactive-shell startup file

PATH=/usr/local/bin:/usr/bin:/bin:/usr/ccs/bin:/sbin:/usr/sbin:/usr/local/openwin/bin:/usr/openwin/bin
MANPATH=/usr/local/man:/usr/man:/usr/share/man

# Boost Fast Code
ABS_DOCHEAD_PATH='C:/Users/Noah/2020SummerStuff/BoostFastCode/boosts/DocHead/dochead.sh'
ABS_BOOST_VIM_PATH='C:/Users/Noah/2020SummerStuff/BoostFastCode/boosts/VimStuff/boost-vim.sh'

alias dochead="$ABS_DOCHEAD_PATH"
alias boost-vim="$ABS_BOOST_VIM_PATH

export HOST=`uname -n`

umask 066
ulimit -c 0		# Don't generate a core file

# From here down is for interactive shells
if [ -n "$PS1" ] ; then

  # This prints the hostname and current path on a window title
  if [ x$DISPLAY != x ] ; then
    PROMPT_COMMAND='echo -n "]2;$HOST:$PWD"'
  fi

  if [ x$TERMINAL_EMULATOR != x ] ; then
    export TERM=$TERMINAL_EMULATOR
  elif [ -f /usr/local/bin/qterm ] ; then
    echo Querying terminal...
    if [ -f ~/.qtermtab ] ; then
      export TERM=`/usr/local/bin/qterm +real +usrtab`
    else
      export TERM=`/usr/local/bin/qterm +real +systab`
    fi
  fi

  set +a

  # settings for interactive shells
  # To turn off the following settings comment it 
    export HISTCONTROL=ignoredups  # Ignore duplicate commands
    export HISTFILESIZE=40         # Remember the last 40 commands
    export HISTSIZE=40             
  # set ignoreeof         # Prevents usage of Control-D from logging out
    set noclobber         # Prevents '>' from overwriting files
  # set noglob            # Prevents wildcard expansion from taking place
    unset noglob
    set notify            # Informs you when a background job terminates


  # Aliases
  # Some familiar DOS commands
  alias   cls=clear
  alias   md=mkdir
  alias   rd=rmdir
  alias   del='rm -i'
  alias   erase='rm -i'
   
  # Some so-I-won't-bash-my-head-into-the-wall-because-I-deleted-a-file commands
  alias   cp='cp -i'
  alias   mv='mv -i'
  alias   rm='rm -i'
 
  # Some commands to make life easier
  alias   open='chmod go+r'
  alias   shut='chmod go-rwx'
  alias   fixlines='stty rows 24 cols 80;stty -tabs;export LINES=24'

  # Some aliased ls commands
  alias   la='ls -a'
  alias   lc='ls -C'
  alias   ll='ls -la'
  #alias   ls='ls -F'
 
  # Some help commands
  alias   help="man man"
  alias   key='man -k'
 
  alias   bye=logout
  alias   lo=logout
  
  alias   ldir='ls -l $* | grep "^d"'

# Aliases for custom tools
# =============================================================================================


# =============================================================================================

  
  # Some prompts
  PS1='{\h:\w} '
  
  # cd path - allows you to change directories without specifying a whole
  # directory path
  CDPATH=:..:~:~/bin

  # functions
  function dir
  {
    if [ $# != 0 ]
    then ls -alF $* | more
    else ls -alF ./ | more
    fi
  }
    
fi 	# Finish processing interactive shell functions

# $Source: /warez/home/skel/src/RCS/.bashrc,v $

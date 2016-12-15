#!/bin/bash

source bootstrap

# if no arg given: print help
if [ "x$1" == "x" ] ; then
  command_exec 'help'
  exit 1
fi

# execute command
command_name="$1"

command_exec $command_name ${@:2}

exit 0

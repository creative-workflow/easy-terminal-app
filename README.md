# easy-terminal-app 1.1 [![Build Status](https://travis-ci.org/creative-workflow/easy-terminal-app.svg?branch=master)](https://travis-ci.org/creative-workflow/easy-terminal-app)
A minimal "terminal-app" with maximum comfort for me, you and all of our [bash](https://de.wikipedia.org/wiki/Bash_(Shell))-scripting friends =)

This **terminal application skeleton** is meant for replacing endless switch-case instructions in your control-scripts. Why reinventing the wheel again and again.

It is **minimal** because it only depends on standard [bash](https://de.wikipedia.org/wiki/Bash_(Shell)).

It has **maximal comfort** because:
  * easyly add a commands by creating bash scripts in a certain folder
  * automatic usage generation (greps command-scripts for specific markers)
  * use logging and colored outputs in your scripts
  * write tests for your scripts and run with travis or similar
  * easy customizing (ca. 300 lines of structured bash code)

# Setup
  1. [download](https://github.com/creative-workflow/easy-terminal-app/archive/master.zip) this repo and extract or run `git clone https://github.com/creative-workflow/easy-terminal-app.git`
  2. `cd easy-terminal-app`
  3. ensure all files are executable `chmod +x ./scripts/* ./app ./bootstrap`
  4. run `./app help`

# Usage
```
Usage: ./app [command] [help|*]
Available commands:
 du                     show diskusage
 help                   print help
 logs                   show app logs
 ps                     show running processes
 test                   run tests

Configuration:
 edit ./bootstrap

Available libs:
 color                  helps dealing with colors in terminal
 command                helps dispatching commands in scripts/commands/*
 log                    helps writing and reading app logs
 os                     helps detecting current os (exports $is_osx, $is_win, $is_linux)

```

# Add new command
Create a new file in the folder `scripts/commands` named `ls` and add the following lines:
```
#!/bin/bash

#command-info: show directory listening of .

ls .
```

This adds a new command named `ls` which simply prints the directory listening of current directory.

Make sure your new commands is executable by running `chmod +x ./scripts/commands/*`.

And now your new command will be listed under help, run `./app help`.


# Logging
### use logging in your scripts
  * `source bootstrap`
  * `log_info "log entry"` displays green text in the terminal
  * `log_debug "log entry"` displays orange text in the terminal
  * `log_error "log entry"` displays red text in the terminal

### enable log to file
  * all log_* calls can also be logged to file (`./logs/[%m_%d_%Y].app.log`)
  * enable this by opening the file `./bootstrap` and set `TERMINAL_APP_LOG_ENABLED` to `1`

### show logs
  * run `./app logs tail` to tail the latest log file
  * you can also pass params to tail: `./app logs tail -n100`
  * there is also `./app logs head` and `./app logs cat` available
  * to see the log command help run `./app logs help`

# Testing
Tests are located under `./scripts/test/*`. You can execute all tests by running `./app test`.

### add a tests
Just duplicate the file `./scripts/test/test_help_command` and write your own test.

Make sure your new test is executable by running `chmod +x ./scripts/test/*`.

### how tests work
A test file executes some commands and it's exit code will be used to determine if a test was successfull or not. Exit code 0 (`exit 0`) means no errors and any other exit code (1-254) indicates that the test failed.


# TODO
  * add advanced command creation guide
  * extend testing capabilities by adding assert functions to `./scripts/lib/test`.
  * add tests for
    * `./scripts/lib/log`
    * `./scripts/lib/command`
    * `./scripts/lib/os`

# CHANGELOG
### 1.1
  * disable log to file per default
  * dont create log folder if log to file is disabled
  * add `say_ok` and `say_failed` to lib/color
  * dont show lib info when printing help
  * auto load all files in lib folder

### 1.0
  * initial release

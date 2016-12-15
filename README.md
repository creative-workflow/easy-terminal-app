# easy-terminal-app 1.0
A minimal "terminal-app" with maximum comfort for me, you and all of my [bash](https://de.wikipedia.org/wiki/Bash_(Shell)-scripting friends =)

It is minimal because it only depends on standard bash.

It has maximal comfort because:
  * easyly add commands by dropping files into a folder
  * has build in help and command listening
  * parses comments from your command file
  * has logging and colored output out of the box
  * has a test infrstructure

# setup
  1. [download](TODO) this repo and extract into your project folder
  2. ensure all files are executable `chmod +x ./scripts/* ./app ./bootsrap`
  3. run `./app help`

# add new command
Create a new file in the folder `scripts/commands` named `ls` and add the following lines:

```
#!/bin/bash

#command-info: show directory listening of .

source bootstrap

ls .
```

This adds a new command named `ls` which simply prints the directory listening of current directory.

Make sure your new commands is executable by running `chmod +x ./scripts/commands/*`.

And now your new command will be listed under help, run `./app help`.


# use logging
Logs are organised into one file per day in the folder `./logs`.

### show logs
  * run `./app logs tail` to tail the latest log file
  * you can also pass params to tail: `./app logs tail -n100`
  * there is also `./app logs head` and `./app logs cat` available
  * to see the log command help run `./app logs help`

### use logging in your scripts
  * `source bootstrap`
  * `log_info "log entry"` displays green text in the terminal and logs to file
  * `log_debug "log entry"` displays orange text in the terminal and logs to file
  * `log_error "log entry"` displays red text in the terminal and logs to file

### disable logging to file (enabled per default)
  * all log entries will be printed and also logged to `logs/[%m_%d_%Y].app.log` per default
  * disable this by opening the file `./bootstrap` and set `TERMINAL_APP_LOG_ENABLED` to `0`


# tests
Tests are located under `./scripts/test/*`. You can execute all tests by running `./app test`.

### add a tests
Just duplicate the file `./scripts/test/test_help_command` and write your test.

Make sure your new test is executable by running `chmod +x ./scripts/test/*`.

### how tests work
A test file executes some commands and it's exit code will be used to determine if a test was successfull or not. Exit code 0 (`exit 0`) means no errors and any other exit code (1-254) indicates that the test failed.


# TODO
  * add setup "one liner", download and extract files from this repo
  * enhance testing by add some assert functions to `./scripts/lib/test`.
  * add tests for
    * `./scripts/lib/log`
    * `./scripts/lib/command`
    * `./scripts/lib/os`


# CONTRIBUTING
Feel free =)


# CHANGELOG
### 1.0
  * initial release

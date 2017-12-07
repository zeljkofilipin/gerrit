#!/bin/bash

# list all directories, cd into each, run `git pull`

# `ls -d */` lists only directories https://stackoverflow.com/a/3667355/17469
# `xargs -n 1` splits the list
# -`I %` replaces `%` with the argument in `sh -c ...`

ls -d */ | xargs -n 1 -I % sh -c 'echo ----------; echo %; cd %; git pull'

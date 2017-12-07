#!/bin/bash

# list all directories, cd into each, run `git pull`

# `find` lists only directories
# -`I %` replaces `%` with the argument in `sh -c`

find . -type d -mindepth 1 -maxdepth 1 | xargs -I % sh -c 'echo ----------; echo %; cd %; git pull'

#!/bin/bash

# list all directories, cd into each, run `git rev-list`

# `find` lists only directories
# `find ... -print0 | xargs -0 ...` is because of https://github.com/koalaman/shellcheck/wiki/SC2038
# -`I %` replaces `%` with the argument in `sh -c`

find . -type d -mindepth 1 -maxdepth 1 -print0 | xargs -0 -I % sh -c 'printf "%,"; cd %; git rev-list --all --after="11/1/2017" --before="10/31/2018" --count'

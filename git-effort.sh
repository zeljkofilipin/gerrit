#!/bin/bash

# list all directories, cd into each, run `git effort`
# dependencies: git-extras https://github.com/tj/git-extras/blob/master/Installation.md

# `find` lists only directories
# `find ... -print0 | xargs -0 ...` is because of https://github.com/koalaman/shellcheck/wiki/SC2038
# -`I %` replaces `%` with the argument in `sh -c`

find . -type d -mindepth 1 -maxdepth 1 -print0 | xargs -0 -I % sh -c 'echo ----------; echo %; cd %; git effort'

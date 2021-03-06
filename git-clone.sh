#!/bin/bash

# list all projects, run `git clone` for each one

# get a list of all gerrit projects
# https://gerrit.wikimedia.org/r/Documentation/cmd-ls-projects.html
for p in $(ssh -p 29418 zfilipin@gerrit.wikimedia.org gerrit ls-projects)
do
  # replacing slashes with underscores in folder names
  # it should make it easier to update all repositories
  # http://www.tldp.org/LDP/abs/html/string-manipulation.html#SUBSTRREPL01
  # ${string//substring/replacement}
  # example: analytics/aggregator/projectview/data becomes analytics_aggregator_projectview_data
  d="${p////_}"

  echo "----------"
  mkdir -p "$(dirname "$d")"
  echo "git clone \"https://gerrit.wikimedia.org/r/$p\" \"${d}\""
  git clone "https://gerrit.wikimedia.org/r/$p" "${d}"
done

for p in `ssh -p 29418 zfilipin@gerrit.wikimedia.org gerrit ls-projects`
do
  mkdir -p `dirname "$p"`
  echo "----------"
  echo "git clone" "https://gerrit.wikimedia.org/r/$p" "$p"
  git clone "https://gerrit.wikimedia.org/r/$p" "$p"
done

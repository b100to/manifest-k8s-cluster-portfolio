#file: pull.sh

git checkout master 
git fetch upstream
git rebase upstream/master
git push -f origin master
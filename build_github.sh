# checkout jekyll branch
git checkout jekyll
# build _site
bundle exec jekyll build

# move site to tmp
mv _site ~/Desktop/
# checkout master and replace content
git checkout master
rm -rf *
mv ~/Desktop/_site/* .
rmdir ~/Desktop/_site

# commit to master
git commit -m "site updated at $(date)"
git push origin master --force
git checkout jekyll
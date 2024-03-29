#!/bin/bash

if [ "$CIRCLE_BRANCH" = "" ]; then
    # It appears that CircleCI doesn't set CIRCLE_BRANCH for tagged builds.
    # Assume we're doing them on the master branch, I guess.
    BRANCH=master
else
    BRANCH=$CIRCLE_BRANCH
fi

echo "Deploying website updates for $BRANCH branch"

if [ `git branch -r | grep "origin/gh-pages" | wc -l` = 0 ]; then
    echo "No gh-pages branch for publication"
    exit
fi

if [ `set | grep GIT_EMAIL | wc -l` = 0 -o `set | grep GIT_USER | wc -l` = 0 ]; then
    echo "No identity configured with GIT_USER/GIT_EMAIL"
    exit
fi

git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_USER

# Save the website files
pushd build > /dev/null
tar cf - . | gzip > /tmp/dist.$$.tar.gz
popd > /dev/null

# Switch to the gh-pages branch
git checkout --track origin/gh-pages

# Unpack the website files
tar zxf /tmp/dist.$$.tar.gz
rm /tmp/dist.$$.tar.gz

git add --verbose .
git commit -m "Successful CircleCI build $CIRCLE_BUILD_NUM"
git push -fq origin gh-pages > /dev/null

echo "Published website to gh-pages."

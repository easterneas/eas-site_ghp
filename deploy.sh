#!/bin/sh

cd _site
git init
git config user.name "Travis CI"
git config user.email "travis@travis-ci.org"
git add .
git commit -m "Auto-deploy from Travis CI build $TRAVIS_BUILD_NUMBER"
git remote add deploy https://$GH_TOKEN@github.com/easterneas/easterneas.github.io > /dev/null 2>&1
git push --force deploy master > /dev/null 2>&1
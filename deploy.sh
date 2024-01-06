#!/bin/bash
set -e
npm run build

# -- for main 
git init
git add -A
git commit -m 'new deployment'
git push -f git@github.com:M4st33r/badr.github.io

# -- for pages branch. 
cd dist
git init
git add -A
git commit -m 'new deployment'
git push -f git@github.com:M4st33r/badr.github.io master:gh-pages
cd -

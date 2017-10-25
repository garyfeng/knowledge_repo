#!/bin/bash

# env
cd ./example_repo/
git remote add origin https://github.com/garyfeng/knowledge_repo.git

git config user.name "Gary Feng"
git config user.email "gary.feng@gmail.com"
git commit -m initial
git pull https://garyfeng@github.com/garyfeng/knowledge_repo.git
cd ..

# start a new post
affix=${RANDOM:0:10}
knowledge_repo --repo ./example_repo create ipynb example_post_$affix.ipynb
knowledge_repo --repo ./example_repo add example_post_$affix.ipynb -p project/example_ipynb_$affix
knowledge_repo --repo ./example_repo submit project/example_ipynb_$affix.kp

# commit; in case the submit did not work.
# git commit -m another repo
# git push --set-upstream origin project/example_ipynb.kp

# now we need to do a pull request and merge on the github



knowledge_repo --repo ./example_repo runserver


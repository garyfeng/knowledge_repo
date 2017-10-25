#!/bin/bash

# instructions on setting up a demo kp

# setting up the git
git remote add origin https://github.com/garyfeng/knowledge_repo.git
git config user.name "Gary Feng"
git config user.email "gary.feng@gmail.com"
git commit -m initial
# pull from the github
git pull https://garyfeng@github.com/garyfeng/knowledge_repo.git

# start a new post with random number added to a static post
affix=${RANDOM:0:10}
knowledge_repo --repo ./example_repo create ipynb example_post_$affix.ipynb
knowledge_repo --repo ./example_repo add example_post_$affix.ipynb -p project/example_ipynb_$affix
knowledge_repo --repo ./example_repo submit project/example_ipynb_$affix.kp

# commit; in case the submit did not work.
# git commit -m another repo
# git push --set-upstream origin project/example_ipynb.kp

# now we need to do a pull request and merge on the github


# serving up the knowledge repo
knowledge_repo --repo ./example_repo runserver


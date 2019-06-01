#!/bin/bash

function newproject() {
    cd
    mkdir Development/$1
    cd Development/$1
    curl -H "Authorization: token {ACCESS_TOKEN}" --data '{"name":"'$1'", "private":true}' https://api.github.com/user/repos
    git init
    git remote add origin https://github.com/{USERNAME}/$1.git
    touch README.md
    touch .gitignore
    echo "# $1" >> README.md
    echo "*.pyc" >> .gitignore
    git add .
    git commit -m "Initial commit"
    git push -u origin master
    code .
}

function remproject() {
    rm -rf Development/$1
    curl -X DELETE -H 'Authorization: token {ACCESS_TOKEN}' https://api.github.com/repos/{USERNAME}/$1
}
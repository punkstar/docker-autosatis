#!/bin/bash

REPO_DIR="/repo"
OUTPUT_DIR="/var/www/html"

mkdir -p ~/.ssh
touch ~/.ssh/known_hosts

echo "$REPO_PRIVATE_KEY" > ~/.ssh/id_rsa

chmod 700 ~/.ssh
chmod 600 ~/.ssh/*

ssh-keyscan -t rsa,dsa $REPO_HOST >> ~/.ssh/known_hosts

if [ -d "$REPO_DIR" ]; then
    cd $REPO_DIR
    git pull origin master --force
else
    git clone $REPO_URL $REPO_DIR
fi

/satis/vendor/bin/satis build --skip-errors $REPO_DIR/config.json $OUTPUT_DIR

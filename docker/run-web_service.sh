#!/bin/sh

echo "Creating tmp public/ dir"
mkdir -p tmp/public

echo "Copying public/ files to tmp/public/"
cp -Rn public/* tmp/public/ \

echo "Starting puma server"
bundle exec puma -C config/puma.rb

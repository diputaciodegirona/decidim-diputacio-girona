#!/bin/sh

mkdir -p tmp/public \
  && cp -Rn public/* tmp/public/ \
  && chown -R 1001:1001 tmp/public/* \
  && bundle exec puma -C config/puma.rb

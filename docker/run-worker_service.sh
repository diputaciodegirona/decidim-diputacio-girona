#!/bin/sh

bundle exec whenever -i decidim-ddgi --update-crontab
bundle exec rake jobs:work
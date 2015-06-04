#!/usr/bin/env bash

echo "Setting path"
export PATH=$PATH:$HOME/ruby/bin:$HOME/ruby_gems/bin
echo $PATH
echo "Starting app"
bundle exec --verbose rackup config.ru -p $PORT

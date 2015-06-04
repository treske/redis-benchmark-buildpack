#!/usr/bin/env bash

echo -e "Setting path"
export PATH=$PATH:$HOME/ruby/bin:$HOME/ruby_gems/bin
echo $PATH
echo -e "Starting app"
bundle exec --verbose rackup config.ru -p $PORT

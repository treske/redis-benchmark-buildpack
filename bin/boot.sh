#!/usr/bin/env bash

echo "boot.sh"

gem env

echo "Setting path"
export PATH=$PATH:$HOME/ruby/bin:$HOME/ruby_gems/bin
echo $PATH

$HOME/ruby/bin/gem env

echo "Starting app"
$HOME/ruby_gems/bin/bundle exec --verbose rackup config.ru -p $PORT

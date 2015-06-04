#!/usr/bin/env bash

echo "boot.sh"

which ruby
gem env

echo "Setting path"
export PATH=$HOME/ruby/bin:$HOME/ruby_gems/bin:$PATH
export GEM_HOME=$HOME/ruby_gems
export GEM_SPEC_CACHE=$HOME/ruby_gems_spec
echo $PATH

gem env

echo "Starting app"
$HOME/ruby_gems/bin/bundle exec --verbose rackup config.ru -p $PORT

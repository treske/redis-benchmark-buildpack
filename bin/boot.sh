#!/usr/bin/env bash

echo "boot.sh"

gem env

export GEM_HOME=$HOME/ruby_gems
export GEM_SPEC_CACHE=$HOME/ruby_gems_spec

which ruby

echo "Starting app"
$HOME/ruby_gems/bin/bundle exec --verbose rackup config.ru -p $PORT

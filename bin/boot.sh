#!/usr/bin/env bash

# Set environment information for custom Ruby Gems
export GEM_HOME=$HOME/ruby_gems
export GEM_SPEC_CACHE=$HOME/ruby_gems_spec

# Start application using bundlder
$HOME/ruby_gems/bin/bundle exec --verbose rackup config.ru -o 0.0.0.0 -p $PORT

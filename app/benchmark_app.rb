require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra'
require 'open3'
require 'json'
require 'pp'
require 'cf-app-utils'

enable :lock

$stdout.sync = true

class RedisBenchmarkApp < Sinatra::Base
  get '/' do
    redis = CF::App::Credentials.find_by_service_name('redis')
    
    cmd = './cmd/redis-benchmark'
    cmd.concat(' -h ')
    cmd.concat(redis['hostname'])
    cmd.concat(' -p ')
    cmd.concat(redis['port'].to_s)
    
    stream do |outp|
      IO.popen(cmd, 'r') do |io|
        while line=io.gets
          outp << '<br>'
          outp << line
        end
      end
    end
  end
end

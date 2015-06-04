require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra'
require 'open3'
require 'json'

enable :lock

$stdout.sync = true

class RedisBenchmarkApp < Sinatra::Base
  get '/' do
    services = JSON.parse(ENV['VCAP_SERVICES'])
    redis_key = services.keys.select { |svc| svc =~ /redis/i }.first
    redis = services[redis_key].first['credentials']
    
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

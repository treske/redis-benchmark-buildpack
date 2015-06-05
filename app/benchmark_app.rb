require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra'
require 'open3'
require 'json'
require 'pp'
require 'cf-app-utils'
require 'yaml'

enable :lock

$stdout.sync = true

class RedisBenchmarkApp < Sinatra::Base
  get '/' do
    # Get 
    redis_benchmark_opts = YAML.load_file("redis_benchmark_spec.yml")
    pp redis_benchmark_opts    

    # Get Redis service credentials
    redis = CF::App::Credentials.find_by_service_name('redis')
    pp redis

    # Concatenate Redis Benchmark command
    cmd = './cmd/redis-benchmark'
    cmd.concat(' -h ')
    cmd.concat(redis['hostname'])
    cmd.concat(' -p ')
    cmd.concat(redis['port'].to_s)

    # Stream output to clients
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

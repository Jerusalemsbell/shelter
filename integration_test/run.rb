#!/usr/bin/env ruby

require 'net/ping'

def check_server
  host = ENV['remote_registry'] ? 'proxy' : 'localhost'
  30.times do
    return if Net::Ping::HTTP.new("http://#{host}").ping?
    sleep 1.5
  end
  fail 'cannot connect to server'
end

check_server
exec 'bundle exec cucumber'


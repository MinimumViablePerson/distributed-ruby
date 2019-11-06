require 'drb/drb'
require_relative 'config.rb'

host = CONFIG[:host]

DRb.start_service
queue = DRbObject.new_with_uri "druby://#{host}:9999"

loop do
  message = queue.pop
  puts message
end

require 'drb/drb'
require_relative 'config.rb'

host = CONFIG[:host]

DRb.start_service
queue = DRbObject.new_with_uri "druby://#{host}:9999"

puts 'Now listening for items in the queue!'

loop do
  message = queue.pop
  puts message
end

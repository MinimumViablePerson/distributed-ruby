require 'drb/drb'
require_relative 'config.rb'

host = CONFIG[:host]

DRb.start_service
queue = DRbObject.new_with_uri "druby://#{host}:9999"

puts 'Add some values to the queue here!'

loop do
  input = gets.chomp
  queue << input
end

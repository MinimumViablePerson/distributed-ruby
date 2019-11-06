require 'drb/drb'
require_relative 'config.rb'

object = Queue.new
host = CONFIG[:host]

DRb.start_service "druby://#{host}:9999", object
DRb.thread.join

#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../config/environment'

print "Creating events: "
File.open("data/event.csv", "r").each_line do |line|
  data = line.split(";")
  nome = data[0].strip
  event = Event.new({
    :category => data[0],
    :title => data[1],
    :description => data[2]
  })
  event.save!
  print '.'
end


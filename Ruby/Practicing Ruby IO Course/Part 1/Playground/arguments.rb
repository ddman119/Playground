#!/usr/bin/env ruby

puts ARGF.argv
puts

ARGF.each_line do |line|
  puts "File name: #{ARGF.filename}" if ARGF.lineno == 1
  puts "#{ARGF.lineno.to_s.rjust(6)}: #{line}"
end

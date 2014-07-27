#!/usr/bin/env ruby

require 'optparse'

options = {}

OptionParser.new do |opts|
  opts.banner = 'Usage: options.rb [options]'

  opts.on('-a', '--an-example', 'An example option') do |v|
    options[:example] = true
  end

  opts.separator ''
  opts.separator 'Second set of options'

  opts.on('-s', '--second-example', 'A second example option') do |v|
    options[:second] = true
  end
end.parse!

p options
p ARGV

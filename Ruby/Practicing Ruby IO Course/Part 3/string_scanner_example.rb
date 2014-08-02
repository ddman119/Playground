require 'strscan'

puts "Scan example:\n"

scanner = StringScanner.new 'aaabbb'
p scanner.scan(/a/)
p scanner.scan(/a/)
p scanner.scan(/a/)
p scanner.scan(/a/)

p scanner

puts "Getch example:\n"

scanner = StringScanner.new 'aaabbb'
p scanner.getch
p scanner.getch
p scanner.getch
p scanner.getch

p scanner

first = "1c0111001f010100061a024b53535009181c"
second = "686974207468652062756c6c277320657965"
#
# first = "0x61747461636b206174206461776e"
# second = "0x6c73d5240a948c86981bc294814d"

def xor_hex_strings(first, second)
  puts first
  puts second
  puts

  (first.hex ^ second.hex).to_s(16)
end

def hex_to_ascii(string)
  [string].pack('H*')
end

puts hex_to_ascii xor_hex_strings(first, second)

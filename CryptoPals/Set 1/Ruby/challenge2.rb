first = "1c0111001f010100061a024b53535009181c"
second = "686974207468652062756c6c277320657965"

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

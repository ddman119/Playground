first = "1c0111001f010100061a024b53535009181c"
second = "686974207468652062756c6c277320657965"

def xor_hex_strings(first, second)
  zipped = hex_to_binary(first).bytes.zip(hex_to_binary(second).bytes)
  zipped.map{ |a,b| a ^ b }.pack('C*')
end

def hex_to_binary(hex_string)
  hex_string.scan(/../).map { |x| x.hex.chr }.join
end

puts xor_hex_strings first, second

hex_string = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"

def hex_to_base64(hex)
  packed = [hex].pack('H*')
  [packed].pack("m").strip
end

puts hex_to_base64(hex_string)

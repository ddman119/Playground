ct = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"
ct_hex = ct.hex

byte_range = 1..255

def ascii_to_hex(ascii)
  ascii.unpack('H*').first
end

byte_range.each do |byte|
  char = byte.chr * ct.length
  char_hex = ascii_to_hex(char).hex

  puts char_hex.class

  # puts (ct_hex ^ char_hex).to_s(16).length
end

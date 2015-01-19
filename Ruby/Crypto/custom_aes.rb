require 'openssl'

cbc_key = "140b41b22a29beb4061bda66b6747e14"
ct = "4ca00ff4c898d61e1edbf1800618fb2828a226d160dad07883d04e008a7897ee\ 
2e4b7465d5290d0c0e6c6822236e1daafb94ffe0c5da05d9476be028ad7c1d81"

def iv_from_ct(ct)
  ct[0..31]
end

def ct_minus_iv(ct)
  ct[31..ct.length]
end

def decrypt(ct, iv, cbc_key)
  cipher = OpenSSL::Cipher::AES128.new(:CBC)
  cipher.decrypt

  cipher.key = hex_string_to_bytes(cbc_key)
  cipher.iv = hex_string_to_bytes(iv)

  cipher.update(hex_string_to_bytes(ct))
end

def hex_string_to_bytes(hex_string)
  # unpacked = hex_string.unpack 'H*'
  # puts unpacked.pack 'a*'
  # unpacked.pack 'a*'

  to_byte_string hex_string
end

def to_byte_string(hex_string)
  puts hex_string.length
  stripped = hex_string.gsub(/\s+/,'')
  puts stripped
  unless stripped.size % 2 == 0
    raise "Can't translate a string unless it has an even number of digits"
  end
  raise "Can't translate non-hex characters" if stripped =~ /[^0-9A-Fa-f]/
  res = [stripped].pack('H*')
  if RUBY_VERSION =~ /1.8/
    res
  else
    res.force_encoding("ascii-8bit")
  end
end

iv = iv_from_ct ct
stripped_ct = ct_minus_iv ct

puts decrypt(stripped_ct, iv, cbc_key)

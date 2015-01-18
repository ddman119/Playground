require 'openssl'

data = 'Hello world'

cipher = OpenSSL::Cipher.new('AES-128-CTR')
cipher.encrypt

key = cipher.random_key
initvec = cipher.random_iv
encrypted = cipher.update(data) + cipher.final

decipher = OpenSSL::Cipher.new('AES-128-CTR')
decipher.decrypt
decipher.key = key
decipher.iv = initvec

plaintext = decipher.update(encrypted) + decipher.final

puts plaintext

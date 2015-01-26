from binascii import unhexlify
from Crypto.Cipher import AES
from Crypto.Util import Counter

# CBC:

key1 = unhexlify('140b41b22a29beb4061bda66b6747e14')

iv1 = unhexlify('4ca00ff4c898d61e1edbf1800618fb28')
ct1 = unhexlify('28a226d160dad07883d04e008a7897ee2e4b7465d5290d0c0e6c6822236e1daafb94ffe0c5da05d9476be028ad7c1d81')

cipher = AES.new(key1, AES.MODE_CBC, iv1)
print cipher.decrypt(ct1)

iv2 = unhexlify('5b68629feb8606f9a6667670b75b38a5')
ct2 = unhexlify('b4832d0f26e1ab7da33249de7d4afc48e713ac646ace36e872ad5fb8a512428a6e21364b0c374df45503473c5242a253')

cipher = AES.new(key1, AES.MODE_CBC, iv2)
print cipher.decrypt(ct2)

# CTR:

key2 = unhexlify('36f18357be4dbd77f050515c73fcf9f2')

iv3 = Counter.new(128, initial_value=int("69dda8455c7dd4254bf353b773304eec",16))
ct3 = unhexlify('0ec7702330098ce7f7520d1cbbb20fc388d1b0adb5054dbd7370849dbf0b88d393f252e764f1f5f7ad97ef79d59ce29f5f51eeca32eabedd9afa9329')

cipher = AES.new(key2, AES.MODE_CTR, counter=iv3)
print cipher.decrypt(ct3)

iv4 = Counter.new(128, initial_value=int("770b80259ec33beb2561358a9f2dc617",16))
ct4 = unhexlify('e46218c0a53cbeca695ae45faa8952aa0e311bde9d4e01726d3184c34451')

cipher = AES.new(key2, AES.MODE_CTR, counter=iv4)
print cipher.decrypt(ct4)

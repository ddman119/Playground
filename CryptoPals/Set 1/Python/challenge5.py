from binascii import hexlify, unhexlify

TARGET = "Burning 'em, if you ain't quick and nimble\nI go crazy when I hear a cymbal"
KEY = "ICE"

def fixed_xor(str1, str2):
    return hex(int(hexlify(str1), 16) ^ int(hexlify(str2), 16))[2:-1]

def extended_key(key, length):
    return (key * ((length / len(key)) + 1))[:length]

print fixed_xor(TARGET, extended_key(KEY, len(TARGET)))

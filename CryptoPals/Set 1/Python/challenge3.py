from binascii import hexlify, unhexlify

target_string = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"

def fixed_xor(str1, str2):
    return ''.join([chr(x ^ y) for x,y in zip(bytearray(str1), bytearray(str2))])

def single_character_xor(string, char):
    char_string = chr(char) * len(string)
    return fixed_xor(string, char_string)

for i in range(1, 255):
    result = single_character_xor(target_string, i)
    print result

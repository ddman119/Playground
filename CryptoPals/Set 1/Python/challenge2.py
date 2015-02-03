from binascii import hexlify, unhexlify

string_one = "1c0111001f010100061a024b53535009181c"
string_two = "686974207468652062756c6c277320657965"

def fixed_xor(str1, str2):
    return hex(int(str1, 16) ^ int(str2, 16))[2:-1]

print fixed_xor(string_one, string_two)

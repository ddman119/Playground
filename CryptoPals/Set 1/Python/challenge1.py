from binascii import unhexlify, b2a_base64

string = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"

def hex_string_to_base_64_string(hex_string):
    data = unhexlify(hex_string)
    return b2a_base64(data)

print hex_string_to_base_64_string(string)

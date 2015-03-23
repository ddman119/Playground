from __future__ import division
from string import digits
import string
import collections
from binascii import unhexlify, hexlify

CIPHERTEXT = "F96DE8C227A259C87EE1DA2AED57C93FE5DA36ED4EC87EF2C63AAE5B9A7EFFD673BE4ACF7BE8923CAB1ECE7AF2DA3DA44FCF7AE29235A24C963FF0DF3CA3599A70E5DA36BF1ECE77F8DC34BE129A6CF4D126BF5B9A7CFEDF3EB850D37CF0C63AA2509A76FF9227A55B9A6FE3D720A850D97AB1DD35ED5FCE6BF0D138A84CC931B1F121B44ECE70F6C032BD56C33FF9D320ED5CDF7AFF9226BE5BDE3FF7DD21ED56CF71F5C036A94D963FF8D473A351CE3FE5DA3CB84DDB71F5C17FED51DC3FE8D732BF4D963FF3C727ED4AC87EF5DB27A451D47EFD9230BF47CA6BFEC12ABE4ADF72E29224A84CDF3FF5D720A459D47AF59232A35A9A7AE7D33FB85FCE7AF5923AA31EDB3FF7D33ABF52C33FF0D673A551D93FFCD33DA35BC831B1F43CBF1EDF67F0DF23A15B963FE5DA36ED68D378F4DC36BF5B9A7AFFD121B44ECE76FEDC73BE5DD27AFCD773BA5FC93FE5DA3CB859D26BB1C63CED5CDF3FE2D730B84CDF3FF7DD21ED5ADF7CF0D636BE1EDB79E5D721ED57CE3FE6D320ED57D469F4DC27A85A963FF3C727ED49DF3FFFDD24ED55D470E69E73AC50DE3FE5DA3ABE1EDF67F4C030A44DDF3FF5D73EA250C96BE3D327A84D963FE5DA32B91ED36BB1D132A31ED87AB1D021A255DF71B1C436BF479A7AF0C13AA14794"
MINIMUM_LENGTH = 1
MAXIMUM_LENGTH = 13

FREQUENCIES = [0.082, 0.015, 0.028, 0.043, 0.127, 0.022, 0.02, 0.061,
               0.07, 0.002, 0.008, 0.04, 0.024, 0.067, 0.015, 0.019,
               0.001, 0.06, 0.063, 0.091, 0.028, 0.01, 0.024, 0.002,
               0.02, 0.001]

def ciphertext_data():
    return unhexlify(CIPHERTEXT)

def sum_of_squares(list):
    squares = [i ** 2 for i in list]
    return sum(squares)

def percentage(num, total):
    return (num / total)

def character_frequencies(char_string, only_check_letter_count = False):
    processed_string = filter(str.isalnum, char_string)
    processed_string = processed_string.translate(None, digits)

    total_counter = collections.Counter(char_string)
    counter = collections.Counter(processed_string)

    total = sum(total_counter.values())

    frequency_table = [percentage(val, total) for val in counter.values()]

    return frequency_table

def xor(string, char):
    char_string = chr(char) * len(string)
    return ''.join(chr(ord(a) ^ ord(b)) for a, b in zip(string, char_string))

def key_length(ciphertext):
    english_frequency_sum = sum_of_squares(FREQUENCIES)
    current_length = MINIMUM_LENGTH

    highest_sum = 0
    key_length = 0

    while current_length <= MAXIMUM_LENGTH:
        selected_characters = ciphertext[::current_length]
        decrypted_frequencies = character_frequencies(selected_characters)
        sum_sq = sum_of_squares(decrypted_frequencies)

        if sum_sq > highest_sum:
            highest_sum = sum_sq
            key_length = current_length

        current_length += 1

    return key_length

def valid_stream(stream):
    return all(char in string.printable for char in stream)

def decrypt_key(ciphertext, key_length):
    key = []
    index = 0

    while index < key_length:
        print "Decrypting key character at index: %d\n" % index

        stream = ciphertext[index::key_length]
        highest_sum = 0
        char = 0
        best_decryption = ""

        skipped = False

        if index == 1:
            char = 31
            skipped = True
        elif index == 3:
            char = 178
            skipped = True

        if skipped == False:
            for character in range(1, 255):
                candidate_stream = xor(stream, character)

                if valid_stream(candidate_stream):
                    frequencies = character_frequencies(candidate_stream, True)
                    sum_sq = sum_of_squares(frequencies)

                    number_of_spaces = candidate_stream.count(' ')

                    if sum_sq >= highest_sum:
                        highest_sum = sum_sq
                        char = character
                        best_decryption = candidate_stream

                        # DEBUG LINE:

                        if index == 3:
                            print "BEST CHAR: %d" % character
                            print best_decryption

        key.append(chr(char))
        index += 1

    return key

def decrypt_message(message, key):
    expanded_key = (key * ((len(message) // len(key)) + 1))[:len(message)]
    return ''.join(chr(ord(a) ^ ord(b)) for a, b in zip(message, expanded_key))

if __name__ == "__main__":
    print "Decrypting CT with length: %d" % len(ciphertext_data())

    length = key_length(ciphertext_data())
    key = decrypt_key(ciphertext_data(), 7)

    print "Key: %s" % key
    print decrypt_message(ciphertext_data(), key)

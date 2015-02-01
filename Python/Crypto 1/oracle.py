import requests
from binascii import hexlify, unhexlify

BASE_URL = 'http://crypto-class.appspot.com/po?er='
CIPHERTEXT = 'f20bdba6ff29eed7b046d1df9fb7000058b1ffb4210a580f748b4ac714c001bd4a61044426fb515dad3f21f18aa577c0bdf302936266926ff37dbf7035d5eeb4'

# The target web service returns a 404 status code if the message has valid
# padding but is malformed, and 403 if the message decrypted but the padding
# was invalid.
VALID_PAD = 404
INVALID_PAD = 403

class PaddingOracle(object):
    def __init__(self):
        self.httpClient = requests.session()

    def decrypt(self, ciphertext):
        ciphertext = unhexlify(ciphertext)
        plaintext = '\x00' * (len(ciphertext)-16)
        pos = len(plaintext) - 1
        xorstr = plaintext

        while pos >= 0:
            print pos
            if (pos + 1) % 16 == 0:
                ciphertext = ciphertext[:(pos+17)]

            guess = 0

            while guess < 256:
                padding = 16 - (pos%16)

                if padding == 0:
                    padding = 16

                paddedString = chr(padding) * padding
                paddedString = self.xorPosition(paddedString, chr(guess), 0)
                xorstr = plaintext[:pos - (pos % 16) + 16]
                xorstr = self.xorPosition(xorstr, paddedString, pos)

                query = hexlify(self.xorPosition(ciphertext, xorstr, 0))
                result = self.query(query)

                if result == True:
                    print 'DECRYPTED: %s (%d)' % (chr(guess), guess)
                    plaintext = self.modifyString(plaintext, chr(guess), pos)
                    break

                guess += 1

                if guess == 256:
                    plaintext = self.modifyString(plaintext, chr(padding), pos)

            pos -= 1

        return plaintext

    # Send a request to the target web service with a given ciphertext query.
    # This returns true if the padding was valid, false if the padding was
    # invalid, or null if we got back some other status code.
    def query(self, query):
        target = BASE_URL + query
        res = self.httpClient.get(target)

        if res.status_code == VALID_PAD:
            return True
        elif res.status_code == INVALID_PAD:
            return False

    # Replace characters in a given string with another string, starting
    # at a certain position.
    def modifyString(self, targetString, replacement, position):
        stringList = list(targetString)
        stringList[position:position + len(replacement)] = list(replacement)
        return ''.join(stringList)

    # XOR the characters in a given string with those of another string,
    # starting at a certain position.
    def xorPosition(self, targetString, xorString, position):
        targetList = list(targetString)
        xorList = list(xorString)
        index = 0

        while index < len(xorString):
            targetList[position + index] = chr(ord(targetList[position + index]) ^ ord(xorList[index]))
            index += 1

        return ''.join(targetList)

    # Remove padding from the decrypted string.
    # A padding value is anywhere from ASCII 0 to 31.
    def stripPadding(targetString):
        lastCharacter = ord(targetString[-1:])
        if lastCharacter < 17 and lastCharacter > 0:
            targetString = targetString[:-lastCharacter]
        return targetString

if __name__ == "__main__":
    oracle = PaddingOracle()
    print oracle.decrypt(CIPHERTEXT)

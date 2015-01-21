import crypt

def testPassword(encrypted_password):
    dictionaryFile = open('/usr/share/dict/words', 'r')
    salt = encrypted_password[0:2]

    for word in dictionaryFile.readlines():
        word = word.strip('\n')
        encryptedWord = crypt.crypt(word, salt)
        if (encryptedWord == encrypted_password):
            print("The password is: " + word)
            return

    print("No password found")
    return

def main():
    testPassword('SSoGG/3SdRW/Y')

if __name__ == '__main__':
    main()

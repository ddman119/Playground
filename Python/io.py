def parseFile(file_name):
    file = open(file_name, 'r')
    for line in file.readlines():
        print line.strip('\n')

def main():
    parseFile('text.txt')

if __name__ == '__main__':
    main()

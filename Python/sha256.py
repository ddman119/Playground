from Crypto.Hash import SHA256

h = SHA256.new()
h.update(b'Hello world')

print h.hexdigest()

import os
from Crypto.Hash import SHA256
from binascii import hexlify, unhexlify

def split_file(f, chunk_size):
    chunks = []
    while True:
        chunk = video_file.read(chunk_size)
        if chunk:
            chunks.append(chunk)
        else:
            break
    return chunks

chunk_size = 1024
video_file = open('video.mp4', 'r')

chunks = split_file(video_file, chunk_size)

previous_sha = ''

for chunk in reversed(chunks):
    processed_chunk = (chunk + previous_sha)
    updated_chunk = SHA256.new(processed_chunk)
    previous_sha = updated_chunk.digest()

print(hexlify(previous_sha))

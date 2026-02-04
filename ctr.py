#Implement AES encryption in CTR mode manually (counter based).
"""
Educational demonstration of a CTR-like stream cipher.

⚠️ WARNING
- This is NOT AES.
- This is NOT cryptographically secure.
    Demonstrates a CTR-like XOR stream cipher.

    keystream_block = key_fragment XOR counter
    ciphertext      = plaintext XOR keystream_block

    This intentionally avoids real AES to keep the math and mechanics visible.
"""

import os

message = input("enter the massage : ").encode()
key = os.urandom(32)

def ctr(message,key):
    counter = int.from_bytes(os.urandom(16),"big")
    block_size = 16
    stream = [message[i:i+block_size] for i in range(0, len(message), block_size)]
    counters = list(map(lambda i: (counter+i).to_bytes(16,'big'),range(len(stream))))
    keystreamints = list(map(lambda c: int.from_bytes(key[:16], 'big') ^ int.from_bytes(c, 'big'), counters))
    cipher = list(map(lambda m,ec : map(lambda ab: ab[0]^ab[1],map(lambda a,b: (a,b),m,ec)),stream,keystreamints ))  # i get chat gpt help in this line but i completly understand it and implement it 
    cipherb = list(map(lambda x : bytes(x),cipher))
    return b"".join(cipherb)



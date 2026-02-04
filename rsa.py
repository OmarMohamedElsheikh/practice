# EDUCATIONAL RSA IMPLEMENTATION
# This code is for learning purposes only.
# It uses insecure key sizes and non-cryptographic randomness.
# Do NOT use this for real security or production systems.

#Generate an RSA private and public key pair in Python.
import sympy
import math
import random


pr1 = sympy.randprime(99999,99999999)

pr2 = sympy.randprime(99999,99999999)
n = pr2*pr1
phi = (pr2-1)*(pr1-1)
candidates_e = [65537,257,17,5,3]
e = None

for i in candidates_e :
    if i < phi and math.gcd(i,phi)==1:
        e = i
        break

        
while True :
    if e :
        break
    c = random.randrange(3, min(phi-1,1<<200)) | 1
    if math.gcd(c,phi) ==1:
        e = c
#i don't know the math to calc d so i get this section of code from chatgpt 
def egcd(a,b):
    if b==0:
        return (a,1,0)
    g,x1,y1 = egcd(b, a%b)
    return (g, y1, x1 - (a//b)*y1)

def modinv(a,m):
    g,x,y = egcd(a,m)
    if g!=1:
        return None
    return x % m
#end of the section from chatgpt
d = modinv(e,phi)
if d is None:
    raise Exception("failed to find inverse")
pubk = (e,n)
prik = (d,n)

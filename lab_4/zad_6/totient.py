import math
from typing import List

def gcd(a: int, b: int) -> int:
    while b != 0:
        c = a % b
        a = b
        b = c

    return a

def totient(n: int) -> int:
    if n <= 0:
        raise ValueError("Must be a positive integer.")
    count = 0
    for i in range(1, n + 1):
        if gcd(i, n) == 1:
            count += 1
    return count

def faster_totient(n: int) -> int:
    if n <= 0:
        raise ValueError("Must be a positive integer.")
    count = n
    i = 2
    sqrt_n = int(math.sqrt(n))
    while i <= sqrt_n:
        if n % i == 0:
            while n % i == 0:
                n //= i
            count -= count // i
        i += 1
    if n > 1:
        count -= count // n
    return count

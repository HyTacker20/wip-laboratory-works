import math

def fill_sieve(n):
    sieve = [True] * (n + 1)
    sieve[0] = sieve[1] = False
    return sieve

def PrimeNumbers(n):
    sieve = fill_sieve(n)
    limit = int(math.sqrt(n))
    for i in range(2, limit + 1):
        if sieve[i]:
            for j in range(i * i, n + 1, i):
                sieve[j] = False
    
    return sum(sieve)

def Prime(n):
    if n < 5:
        upper_limit = n * 2 + 1
    else:
        upper_limit = n + int(n * (math.log(n) + math.log(math.log(n))))

    sieve = [False] * (upper_limit)
    
    fill_sieve(sieve, upper_limit)
    calculate_sieve(sieve, upper_limit)

    count = 0
    for i, number in enumerate(sieve):
        if number:
            count += 1
            if count == n:
                return i

def IsPrime(n):
    if n < 2:
        return False
    if n == 2:
        return True
    if n % 2 == 0:
        return False
    for i in range(3, int(math.sqrt(n)) + 1, 2):
        if n % i == 0:
            return False
    return True

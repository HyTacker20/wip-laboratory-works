import math

def fill_sieve(sieve, upper_limit):
    sieve[0] = False
    sieve[1] = False
    for i in range(2, upper_limit):
        sieve[i] = True

def calculate_sieve(sieve, upper_limit):
    sqrt_value = int(math.sqrt(upper_limit))
    for i in range(2, sqrt_value + 1):
        if sieve[i]:
            for j in range(i * i, upper_limit, i):
                sieve[j] = False

def find_nth_prime(n):
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

def main():
    n = int(input("Podaj N: "))
    nth_prime = find_nth_prime(n)
    print(f"The {n}-th prime number is: {nth_prime}")

if __name__ == "__main__":
    main()

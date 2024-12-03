import math

def input_data():
    while True:
        try:
            n = int(input("Podaj liczbe N (N > 2): "))
            if n > 2:
                return n
            else:
                print("Error: N musi byc wieksze od 2.")
        except ValueError:
            print("Error: Wprowadzone N musi byc liczba calkowita.")

def fill_sieve(n):
    sieve = [True] * (n + 1)
    sieve[0] = sieve[1] = False
    return sieve

def calculate_sieve(sieve, n):
    limit = int(math.sqrt(n))
    for i in range(2, limit + 1):
        if sieve[i]:
            for j in range(i * i, n + 1, i):
                sieve[j] = False

def print_result(sieve):
    primes = [i for i, is_prime in enumerate(sieve) if is_prime]
    print(f"Proste liczby (ilość - {len(primes)}):")
    print(" ".join(map(str, primes)))

def main():
    n = input_data()
    sieve = fill_sieve(n)
    calculate_sieve(sieve, n)
    print_result(sieve)

if __name__ == "__main__":
    main()

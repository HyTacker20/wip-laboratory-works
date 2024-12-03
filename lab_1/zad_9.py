def main():
    n = int(input("Podaj liczbę n: "))
    p = int(input("Podaj podstawę p: "))

    original = n
    reversed = 0

    while n > 0:
        remainder = n % p
        reversed = reversed * p + remainder
        n = n // p

    print(f"Palindrom? {original == reversed}")

if __name__ == "__main__":
    main()
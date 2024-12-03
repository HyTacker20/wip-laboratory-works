def euklid_algorytm(a: int, b: int) -> int:
    if a == 0 and b == 0:
        raise ValueError("Can't be both 0.")
    
    while b != 0:
        c = a % b
        a = b
        b = c

    return a

def main():
    a = abs(int(input("Podaj pierwszą liczbę: ")))
    b = abs(int(input("Podaj drugą liczbę: ")))


    print(f"Największy wspólny dzielnik to {euklid_algorytm(a, b)}")

if __name__ == "__main__":
    main()

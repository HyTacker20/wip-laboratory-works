def main():
    a = abs(int(input("Podaj pierwszą liczbę: ")))
    b = abs(int(input("Podaj drugą liczbę: ")))

    if a == 0 and b == 0:
        print("Error!")
        return
    
    while b != 0:
        c = a % b
        a = b
        b = c

    print(f"Największy wspólny dzielnik to {a}")

if __name__ == "__main__":
    main()

import math

def is_prime(n):
    if n <= 1:
        return False
    if n == 2:
        return True  
    if n % 2 == 0:
        return False 
    
    for i in range(3, int(math.sqrt(n)) + 1, 2):  
        if n % i == 0:
            return False
    return True

def main():
    n = int(input("Podaj n: "))

    wynik = is_prime(n)

    if wynik:
        print("Pierwsza")
    else:
        print("Nie pierwsza")

if __name__ == "__main__":
    main()
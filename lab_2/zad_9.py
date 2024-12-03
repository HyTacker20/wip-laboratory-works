import math


def prime_factors(n) -> list:
    factors_list = [] 

    if n == 0 or n == 1:
        print("Nie ma czynnikow pierwszych.")
        return []
    
    while n % 2 == 0:
        factors_list.append(2)
        n //= 2 

    sqrt_n = math.sqrt(n)

    for i in range(3, int(sqrt_n) + 1, 2):
        while n % i == 0:
            factors_list.append(i)
            n //= i

    if n > 1:
        factors_list.append(n)

    return factors_list

def print_prime_factors(n):
    factors_list = prime_factors(n) 
    
    wynik = (f"{n} = ") 
    
    licznik = 1  
    for i in range(1, len(factors_list)):
        if factors_list[i] == factors_list[i - 1]:  
            licznik += 1  
        else:
            if licznik > 1:
                wynik += (f"{factors_list[i - 1]}^{licznik}")
            else:
                wynik += str(factors_list[i - 1])
            
            wynik += "*"  
            licznik = 1  
    

    wynik += str(factors_list[-1])
    
    print(wynik)  

n = abs(int(input("Wpisz n: ")))
try:
    print_prime_factors(n)
except ValueError as e:
    print(f"Error: {e}")
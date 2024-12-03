def dwumian_newtona(n, k):
    tablica = [[0] * (k + 1) for _ in range(n + 1)]

    for i in range(n + 1):
        for j in range(min(i, k) + 1):
            if j == 0 or j == i:
                tablica[i][j] = 1
            else:
                tablica[i][j] = tablica[i - 1][j - 1] + tablica[i - 1][j]

    return tablica[n][k]

def main():
    try:
        n = int(input("Podaj N: "))
        k = int(input("Podaj K: "))
    except ValueError:
        print("Error: Wprowadzone dane musza byc liczbami calkowitymi.")
        return

    if n < 0 or k < 0 or k > n:
        print("Error: niepoprawne dane - 0 <= K <= N.")
        return

    result = dwumian_newtona(n, k)

    print(f"Dwumian Newtona dla N={n} i K={k}: {result}")

if __name__ == "__main__":
    main()

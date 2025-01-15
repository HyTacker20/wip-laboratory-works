import sys


def print_solution(position, n):
    print(" ".join(str(position[i]) for i in range(1, n + 1)))

def ustaw(i, n, position, bije_wiersz, bije_przek1, bije_przek2, solution_count):
    for j in range(1, n + 1):
        if not (bije_wiersz[j] or bije_przek1[i + j] or bije_przek2[i - j + n]):
            position[i] = j
            bije_wiersz[j] = bije_przek1[i + j] = bije_przek2[i - j + n] = True

            if i < n:
                solution_count = ustaw(i + 1, n, position, bije_wiersz, bije_przek1, bije_przek2, solution_count)
            else:
                print_solution(position, n)
                solution_count += 1

            # Повертаємося до попереднього стану
            position[i] = 0
            bije_wiersz[j] = bije_przek1[i + j] = bije_przek2[i - j + n] = False

    return solution_count

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python n_queens.py <number of queens>")
        sys.exit(1)

    try:
        n = int(sys.argv[1])
        if n <= 0:
            raise ValueError
    except ValueError:
        print("Please provide a positive integer.")
        sys.exit(1)

    position = [0] * (n + 1)
    bije_wiersz = [False] * (n + 1)
    bije_przek1 = [False] * (2 * n + 1)
    bije_przek2 = [False] * (2 * n + 1)

    solution_count = ustaw(1, n, position, bije_wiersz, bije_przek1, bije_przek2, 0)

    print(f"Number of solutions: {solution_count}")

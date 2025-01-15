solution_count = 0

def check(a, index_a, b, index_b):
    return abs(a - b) == abs(index_a - index_b)

def generate_permutation(array, start, n):
    global solution_count
    if start == n:
        result = False
        for i in range(n):
            for j in range(i + 1, n):
                if check(array[i], i, array[j], j):
                    result = True
                    break
            if result:
                break
        if not result:
            solution_count += 1
            print(array)
    else:
        for i in range(start, n):
            array[start], array[i] = array[i], array[start]
            generate_permutation(array, start + 1, n)
            array[start], array[i] = array[i], array[start]

if __name__ == "__main__":
    n = int(input("Input number of queens: "))
    array = [i + 1 for i in range(n)]
    solution_count = 0
    generate_permutation(array, 0, n)
    print(f"Number of solutions: {solution_count}")

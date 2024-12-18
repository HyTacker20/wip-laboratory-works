import math

def findzero(f, a, b, eps):
    start = a
    end = b

    if f(start) * f(end) > 0:
        print("ERROR!")
        return

    while abs(end - start) >= eps:
        middle = (start + end) / 2.0

        if abs(f(middle)) < eps:
            print(f"Zero = {middle:.2f}")
            return middle
        elif f(start) * f(middle) < 0:
            end = middle
        else:
            start = middle

    result = (start + end) / 2.0
    print(f"Zero = {result:.2f}")
    return result

def cos_half(x):
    return math.cos(x / 2)

def main():
    findzero(cos_half, 2, 4, 0.001)

if __name__ == "__main__":
    main()
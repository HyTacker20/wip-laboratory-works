import math


def main():
    a = float(input("Podaj współczynnik a: "))
    b = float(input("Podaj współczynnik b: "))
    c = float(input("Podaj współczynnik c: "))

    delta = b**2 - 4 * a * c

    if delta < 0:
        print("Brak rozwiązań w zbiorze liczb rzeczywistych.")
    elif delta == 0:
        x = -b / (2 * a)
        print(f"{x=}")
    else:
        x1 = (-b + math.sqrt(delta)) / (2 * a)
        x2 = (-b - math.sqrt(delta)) / (2 * a)
        print(f"{x1=}, {x2=}")


if __name__ == "__main__":
    main()

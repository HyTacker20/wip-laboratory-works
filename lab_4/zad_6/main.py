import sys
from totient import totient, faster_totient

def main():
    if len(sys.argv) < 2:
        print("Error: No numbers provided.")
        return

    for arg in sys.argv[1:]:
        try:
            number = int(arg)
            if number <= 0:
                raise ValueError

            result = totient(number)
            print(f"Totient({number}) = {result}")

        except ValueError:
            print(f"Error: Invalid number '{arg}'. Please provide positive integers.")
    
    for arg in sys.argv[1:]:
        try:
            number = int(arg)
            if number <= 0:
                raise ValueError

            result = faster_totient(number)
            print(f"Faster Totient({number}) = {result}")

        except ValueError:
            print(f"Error: Invalid number '{arg}'. Please provide positive integers.")

if __name__ == "__main__":
    main()

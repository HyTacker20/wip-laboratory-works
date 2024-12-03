import sys
from prime_functions import PrimeNumbers, Prime, IsPrime

def main():
    if len(sys.argv) != 3:
        print("Error! Must be: python main.py <command> <number>")
        return

    command = sys.argv[1]
    try:
        number = int(sys.argv[2])
    except ValueError:
        print("Error: The number must be an integer.")
        return

    if command == "pn":
        print(PrimeNumbers(number))
    elif command == "pr":
        try:
            print(Prime(number))
        except ValueError as e:
            print(f"Error: {e}")
    elif command == "ip":
        print(IsPrime(number))
    else:
        print("Error! Unknown command. Use 'pn', 'pr', or 'ip'.")

if __name__ == "__main__":
    main()

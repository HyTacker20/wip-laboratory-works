LENGTH = 4
DIGITS = 6

def print_code(code):
    print(" ".join(map(str, code)) + "?")

def check_code(guess, secret):
    correct_positions = 0
    correct_digits = 0
    used_secret = [False] * LENGTH
    used_guess = [False] * LENGTH
    for i in range(LENGTH):
        if guess[i] == secret[i]:
            correct_positions += 1
            used_secret[i] = True
            used_guess[i] = True
    for i in range(LENGTH):
        if not used_guess[i]:
            for j in range(LENGTH):
                if not used_secret[j] and guess[i] == secret[j]:
                    correct_digits += 1
                    used_secret[j] = True
                    break
    return correct_positions, correct_digits

def generate_all_codes():
    all_codes = []
    for a in range(1, DIGITS + 1):
        for b in range(1, DIGITS + 1):
            for c in range(1, DIGITS + 1):
                for d in range(1, DIGITS + 1):
                    all_codes.append([a, b, c, d])
    return all_codes

def check_if_possible(guess, candidate, current_positions, current_digits):
    checked_positions, checked_digits = check_code(guess, candidate)
    return checked_positions == current_positions and checked_digits == current_digits

def main():
    all_codes = generate_all_codes()
    possible = [True] * len(all_codes)
    guess_count = 0
    max_guesses = 8
    while guess_count < max_guesses:
        guess_index = -1
        for i, is_possible in enumerate(possible):
            if is_possible:
                guess_index = i
                break
        if guess_index == -1:
            print("Oszukujesz!")
            return
        guess_count += 1
        guess = all_codes[guess_index]
        print(f"{guess_count}: ", end="")
        print_code(guess)
        correct_positions = int(input("Na swoim miejscu: "))
        correct_digits = int(input("Nie na swoim miejscu: "))
        if correct_positions == LENGTH:
            print("Wygralem.")
            return
        for i in range(len(all_codes)):
            if possible[i]:
                if not check_if_possible(guess, all_codes[i], correct_positions, correct_digits):
                    possible[i] = False
    print(f"Nie zgadlem kodu w {max_guesses} probach :(")

if __name__ == "__main__":
    main()

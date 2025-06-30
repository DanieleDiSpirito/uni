from sys import argv
from math import sqrt

def find_div(n: int) -> None:
    # max_div: int = 1
    # while i < n//max_div: # --> 43.549, 4:00.29, 36.238
    i: int = 1
    while i < sqrt(n): # --> 53.678, 53.638, 45.942
        if n % i == 0:
            # max_div = i
            yield i
            yield n//i
        i += 1

def main():
    if len(argv) == 1:
        n: int = int(input('Inserire un numero: '))
    else:
        n = int(argv[1])
    print(f'I divisori di {n} sono:')
    print(sorted(find_div(n)))

if __name__ == '__main__':
    main()
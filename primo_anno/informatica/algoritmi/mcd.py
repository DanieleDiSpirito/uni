def mcd(a: int, b: int) -> int:
    if a == 0:
        return b
    if b == 0:
        return a
    a, b = max(a,b), min(a,b)
    while True:
        r: int = a % b
        if r == 0:
            return b
        if r == 1:
            return 1
        a, b = b, r

def main():
    a: int = int(input('Inserire un numero: '))
    b: int = int(input('Inserire un numero: '))
    print(f'Il MCD tra {a} e {b} è {mcd(a,b)}')

if __name__ == '__main__':
    main()
from sys import argv

def is_leap(year: int) -> bool:
    if (year % 100 == 0 and year % 400 == 0) or (year % 100 != 0 and year % 4 == 0):
        return True

def main():
    if len(argv) == 1:
        year: int = int(input("Inserire l'anno: "))
    else:
        year = int(argv[1])
    print(f"Il {year} {'non ' if not is_leap(year) else ''}è bisestile")

if __name__ == '__main__':
    main()
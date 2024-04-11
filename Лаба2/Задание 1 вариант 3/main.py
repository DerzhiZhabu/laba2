import math

def check_p(x):
    b = 0
    for i in range(x, 1, -1):
        z = 1
        for j in range(2, int(math.sqrt(i)) + 1):
            if i % j == 0:
                z = 0
                break
        if z == 1:
            b = i
            break
    for i in range(x, x**10, 1):
        z = 1
        for j in range(2, int(math.sqrt(i)) + 1):
            if i % j == 0:
                z = 0
                break
        if z:
            if x - b > i - x:
                b = i
            break
    return b

def main():
    x = int(input("Enter a number: "))
    print(abs(x - check_p(x)))

if __name__ == "__main__":
    main()

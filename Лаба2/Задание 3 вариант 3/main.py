inputs = input().split()
n = int(inputs[0])

count = 0
for i in range(1, n + 1):
    g = int(inputs[i])
    number = g
    while number > 0:
        h = number % 10
        number //= 10
        if h % 3 == 0:
            count += h

print(count)

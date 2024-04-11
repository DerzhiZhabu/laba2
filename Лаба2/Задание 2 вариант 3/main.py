wh = {}
keys = []
col = {'R': 0, 'W': 1, 'B': 2}

a = input()

for i in range(0, len(a)//2):
    colc = int(a[i * 2 + 1])
    if colc in wh:
        wh[colc][col[a[i * 2]]] = 1
    else:
        colors = [0, 0, 0]
        colors[col[a[i * 2]]] = 1
        wh[colc] = colors
        keys.append(colc)

count = 0
for key in keys:
    b = wh[key]
    if sum(b) == 3:
        count += 1

print(count)

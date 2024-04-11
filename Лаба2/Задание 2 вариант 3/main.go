package main

import (
	"fmt"
	"strconv"
)

func main() {
	wh := make(map[int][]int)
	var keys []int
	col := map[byte]int{'R': 0, 'W': 1, 'B': 2}

	var a string
	fmt.Scanln(&a)

	for i := 0; i < len(a)/2; i++ {
		colc, _ := strconv.Atoi(string(a[i*2+1]))
		if _, ok := wh[colc]; ok {
			wh[colc][col[a[i*2]]] = 1
		} else {
			colors := make([]int, 3)
			colors[col[a[i*2]]] = 1
			wh[colc] = colors
			keys = append(keys, colc)
		}
	}

	count := 0
	for _, key := range keys {
		if b, ok := wh[key]; ok {
			if b[0]+b[1]+b[2] == 3 {
				count++
			}
		}
	}

	fmt.Println(count)
}

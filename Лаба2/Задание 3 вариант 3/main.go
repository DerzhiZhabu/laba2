package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	reader := bufio.NewReader(os.Stdin)
	input, err := reader.ReadString('\n')
	if err != nil {
		fmt.Println("Failed to read input:", err)
		os.Exit(1)
	}

	inputs := strings.Fields(input)

	n, err := strconv.Atoi(inputs[0])
	if err != nil {
		fmt.Println("Invalid input:", err)
		os.Exit(1)
	}

	count := 0
	for i := 1; i <= n; i++ {
		g, err := strconv.Atoi(inputs[i])
		if err != nil {
			fmt.Println("Invalid input:", err)
			os.Exit(1)
		}
		number := g
		for number > 0 {
			h := number % 10
			number /= 10
			if h%3 == 0 {
				count += h
			}
		}
	}

	fmt.Println(count)
}

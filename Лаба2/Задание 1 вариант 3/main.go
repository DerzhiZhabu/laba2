package main

import (
    "fmt"
    "math"
)

func checkP(x int) int {
    var b int
    var z int
    for i := x; i > 1; i-- {
        z = 1
        for j := 2; j <= int(math.Sqrt(float64(i))); j++ {
            if i%j == 0 {
                z = 0
                break
            }
        }
        if z == 1 {
            b = i
            break
        }
    }
    for i := x; ; i++ {
        z = 1
        for j := 2; j <= int(math.Sqrt(float64(i))); j++ {
            if i%j == 0 {
                z = 0
                break
            }
        }
        if z == 1 {
            if x-b > i-x {
                b = i
            }
            break
        }
    }
    return b
}

func main() {
    var x int
    fmt.Scan(&x)
    fmt.Println(int(math.Abs(float64(x - checkP(x)))))
}
import Foundation

func checkP(_ x: Int) -> Int {
    var b = 0
    var z: Int
    for i in stride(from: x, to: 1, by: -1) {
        z = 1
        for j in 2...Int(sqrt(Double(i))) {
            if i % j == 0 {
                z = 0
                break
            }
        }
        if z == 1 {
            b = i
            break
        }
    }
    for i in x... {
        z = 1
        for j in 2...Int(sqrt(Double(i))) {
            if i % j == 0 {
                z = 0
                break
            }
        }
        if z == 1 {
            if x - b > i - x {
                b = i
            }
            break
        }
    }
    return b
}

if let input = readLine(), let x = Int(input) {
    print(abs(x - checkP(x)))
} else {
    print("Invalid input")
}
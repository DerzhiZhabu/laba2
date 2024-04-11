var count = 0

if let input = readLine() {
    let inputs = input.split(separator: " ")
    if let n = Int(inputs[0]) {
        var remainingInputs = inputs.dropFirst()
        for _ in 0..<n {
            if let k = Int(remainingInputs.removeFirst()) {
                var number = k
                while number > 0 {
                    let h = number % 10
                    number /= 10
                    if h % 3 == 0 {
                        count += h
                    }
                }
            }
        }
    }
}

print(count)

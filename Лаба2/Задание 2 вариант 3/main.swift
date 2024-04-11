import Foundation

var wh = [Int: [Int]]()
var keys = [Int]()
let col: [Character: Int] = ["R": 0, "W": 1, "B": 2]

if let a = readLine() {
    for i in stride(from: 0, to: a.count / 2, by: 1) {
        let index1 = a.index(a.startIndex, offsetBy: i * 2)
        let index2 = a.index(a.startIndex, offsetBy: i * 2 + 1)
        let colc = Int(String(a[index2])) ?? 0
        if let value = wh[colc] {
            var vec = value
            let character = a[index1]
            if let colIndex = col[character] {
                vec[colIndex] = 1
                wh[colc] = vec
            }
        } else {
            var colors = [0, 0, 0]
            let character = a[index1]
            if let colIndex = col[character] {
                colors[colIndex] = 1
                wh[colc] = colors
                keys.append(colc)
            }
        }
    }
    
    var count = 0
    for key in keys {
        if let b = wh[key], b.reduce(0, +) == 3 {
            count += 1
        }
    }
    
    print(count)
}

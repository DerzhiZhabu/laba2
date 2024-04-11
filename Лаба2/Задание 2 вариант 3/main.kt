import java.util.Scanner

fun main() {
    val scanner = Scanner(System.`in`)
    val wh = mutableMapOf<Int, MutableList<Int>>()
    val keys = mutableListOf<Int>()
    val col = mapOf('R' to 0, 'W' to 1, 'B' to 2)
    
    val a = scanner.nextLine()

    for (i in 0 until a.length / 2) {
        val colc = Character.getNumericValue(a[i * 2 + 1])
        if (wh.containsKey(colc)) {
            wh[colc]?.set(col[a[i * 2]]!!, 1)
        } else {
            val colors = MutableList(3) { 0 }
            colors[col[a[i * 2]]!!] = 1
            wh[colc] = colors
            keys.add(colc)
        }
    }

    var count = 0
    for (i in keys.indices) {
        val b = wh[keys[i]]
        if (b != null && b[0] + b[1] + b[2] == 3) {
            count++
        }
    }

    println(count)
    scanner.close()
}

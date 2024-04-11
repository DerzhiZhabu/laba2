import kotlin.math.sqrt

fun checkP(x: Int): Int {
    var b = 0
    var z: Int
    for (i in x downTo 2) {
        z = 1
        for (j in 2..sqrt(i.toDouble()).toInt()) {
            if (i % j == 0) {
                z = 0
                break
            }
        }
        if (z == 1) {
            b = i
            break
        }
    }
    for (i in x..Int.MAX_VALUE) {
        z = 1
        for (j in 2..sqrt(i.toDouble()).toInt()) {
            if (i % j == 0) {
                z = 0
                break
            }
        }
        if (z == 1) {
            if (x - b > i - x) {
                b = i
            }
            break
        }
    }
    return b
}

fun main() {
    val x = readLine()!!.toInt()
    println(Math.abs(x - checkP(x)))
}

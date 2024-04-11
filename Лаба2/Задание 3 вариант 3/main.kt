fun main() {
    val inputs = readLine()!!.split(" ")
    val n = inputs[0].toInt()

    var count = 0
    for (i in 1..n) {
        val g = inputs[i].toInt()
        var number = g
        while (number > 0) {
            val h = number % 10
            number /= 10
            if (h % 3 == 0) {
                count += h
            }
        }
    }

    println(count)
}

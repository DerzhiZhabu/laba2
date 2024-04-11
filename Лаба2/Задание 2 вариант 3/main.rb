wh = {}
keys = []
col = { 'R' => 0, 'W' => 1, 'B' => 2 }

a = gets.chomp

(0...(a.length / 2)).each do |i|
    colc = a[i * 2 + 1].to_i
    if wh.key?(colc)
        wh[colc][col[a[i * 2]]] = 1
    else
        colors = [0, 0, 0]
        colors[col[a[i * 2]]] = 1
        wh[colc] = colors
        keys << colc
    end
end

count = 0
keys.each do |key|
    b = wh[key]
    if b&.sum == 3
        count += 1
    end
end

puts count

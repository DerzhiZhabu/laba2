count = 0

input = gets.chomp.split
n = input.shift.to_i

n.times do
    k = input.shift.to_i
    while k > 0
        h = k % 10
        k /= 10
        count += h if h % 3 == 0
    end
end

puts count

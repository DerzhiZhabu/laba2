def check_p(x)
    b = 0
    (2..x).reverse_each do |i|
      z = 1

      (2..Math.sqrt(i).to_i).each do |j|
        if i % j == 0
          z = 0
          break
        end
      end

      if z == 1
        b = i
        break
      end

    end

    (x..).each do |i|
      z = 1

      (2..Math.sqrt(i).to_i).each do |j|
        if i % j == 0
          z = 0
          break
        end

      end

      if z == 1
        if x - b > i - x
          b = i
        end

        break
      end

    end
    
    b
  end
  
  x = gets.chomp.to_i
  puts (x - check_p(x)).abs
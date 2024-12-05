#advent of code day 4 part 1

sum = 0

input = File.read_lines("input.txt")

#input.each { |line| puts line }

(0..input.size-1).each do |i|
  (0..input[i].size-1).each do |j|
    #puts i.to_s + " " + j.to_s
    if input[i][j] == 'X'
      #yeah yeah yeah i know
      if i >= 3 && input[i-1][j] == 'M' && input[i-2][j] == 'A' && input[i-3][j] == 'S'
        sum += 1
      end
      if i <= input.size-4 && input[i+1][j] == 'M' && input[i+2][j] == 'A' && input[i+3][j] == 'S'
        sum += 1
      end
      if j >= 3 && input[i][j-1] == 'M' && input[i][j-2] == 'A' && input[i][j-3] == 'S'
        sum += 1
      end
      if j <= input[i].size-4 && input[i][j+1] == 'M' && input[i][j+2] == 'A' && input[i][j+3] == 'S'
        sum += 1
      end
      if i >= 3 && j >= 3 && input[i-1][j-1] == 'M' && input[i-2][j-2] == 'A' && input[i-3][j-3] == 'S'
        sum += 1
      end
      if i <= input.size-4 && j <= input[i].size-4 && input[i+1][j+1] == 'M' && input[i+2][j+2] == 'A' && input[i+3][j+3] == 'S'
        sum += 1
      end
      if j >= 3 && i <= input.size-4 && input[i+1][j-1] == 'M' && input[i+2][j-2] == 'A' && input[i+3][j-3] == 'S'
        sum += 1
      end
      if i >= 3 && j <= input[i].size-4 && input[i-1][j+1] == 'M' && input[i-2][j+2] == 'A' && input[i-3][j+3] == 'S'
        sum += 1
      end
    end
  end
end

puts sum
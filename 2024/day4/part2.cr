#advent of code day 4 part 2

sum = 0

input = File.read_lines("input.txt")

#input.each { |line| puts line }

(0..input.size-1).each do |i|
  (0..input[i].size-1).each do |j|
    #puts i.to_s + " " + j.to_s
    if input[i][j] == 'A'
      #yeah yeah yeah i know
      if i >= 1 && j >= 1 && i <= input.size-2 && j <= input.size-2 && input[i-1][j-1] == 'M' && input[i-1][j+1] == 'M' && input[i+1][j+1] == 'S' && input[i+1][j-1] == 'S'
        sum += 1
      end
      if i >= 1 && j >= 1 && i <= input.size-2 && j <= input.size-2 && input[i-1][j-1] == 'S' && input[i-1][j+1] == 'S' && input[i+1][j+1] == 'M' && input[i+1][j-1] == 'M'
        sum += 1
      end
      if i >= 1 && j >= 1 && i <= input.size-2 && j <= input.size-2 && input[i-1][j-1] == 'M' && input[i-1][j+1] == 'S' && input[i+1][j+1] == 'S' && input[i+1][j-1] == 'M'
        sum += 1
      end
      if i >= 1 && j >= 1 && i <= input.size-2 && j <= input.size-2 && input[i-1][j-1] == 'S' && input[i-1][j+1] == 'M' && input[i+1][j+1] == 'M' && input[i+1][j-1] == 'S'
        sum += 1
      end
    end
  end
end

puts sum
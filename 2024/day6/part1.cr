#advent of code day 6 part 1

sum = 0

input = File.read_lines("input.txt")
spaces = Array(Array(Char)).new
input.each { |str| spaces << str.chars }
inbounds = true
dir = 1

x = 0
y = 0

#find start
(0..input.size-1).each do |i|
  (0..input[i].size-1).each do |j|
    if input[i][j] == '^'
      x = i
      y = j
      spaces[i][j] = 'X'
    end
  end
end

while inbounds
  #up
  if dir == 1
    if x - 1 >= 0
      if input[x-1][y] != '#'
        x -= 1
        spaces[x][y] = 'X'
      else
        dir = 2
      end
    else
      inbounds = false
    end

  #right
  elsif dir == 2
    if y + 1 < input[x].size
      if input[x][y+1] != '#'
        y += 1
        spaces[x][y] = 'X'
      else
        dir = 3
      end
    else
      inbounds = false
    end

  #down
  elsif dir == 3
    if x + 1 < input.size
      if input[x+1][y] != '#'
        x += 1
        spaces[x][y] = 'X'
      else
        dir = 4
      end
    else
      inbounds = false
    end

  #left
  elsif dir == 4
    if y - 1 >= 0
      if input[x][y-1] != '#'
        y -= 1
        spaces[x][y] = 'X'
      else
        dir = 1
      end
    else
      inbounds = false
    end

  end
end

spaces.each { |chars| sum += chars.count { |c| c == 'X'} }

puts sum
#advent of code day 14 part 2

def getsection(input)
  weight = 0
  (0..input[0].size-1).each do |i|
    roll = 0
    (0..input.size-1).each do |j|
      if input[j][i] == 'O'
        input[j][i] = '.'
        input[roll][i] = 'O' if roll < input[0].size
        weight += input.size - roll
        roll += 1
      elsif input[j][i] == '#'
        roll = j+1 if j+1 < input[0].size
      end
    end
  end
  return weight, input
end

def getwest(input)
  weight = 0
  (0..input[0].size-1).each do |i|
    roll = 0
    (0..input.size-1).each do |j|
      if input[i][j] == 'O'
        input[i][j] = '.'
        input[i][roll] = 'O' if roll >= 0
        roll += 1
      elsif input[i][j] == '#'
        roll = j+1 if j+1 > 0
      end
    end
  end
  return weight, input
end


temp = File.read_lines("input")
#input = input.map { |i| i.chars }

input = Array(Array(Char)).new
temp.each do |t|
  input << t.chars
end

x = 0_i64
weight = 0
#looks like it repeats every 7, with the one i want starting at 5
#theres another cycle of 24 in there? idk i found one that works
while x < 832
  #puts x if x % 100000 == 0

  #run it as north first
  weight, input = getsection(input)

  #west
  weight, input = getwest(input)

  #south (flip then north)
  (0..input.size-1).each { |i| input[i] = input[i].reverse }
  input = input.reverse
  weight, input = getsection(input)

  #east (west as flipped, then flip back)
  weight, input = getwest(input)
  (0..input.size-1).each { |i| input[i] = input[i].reverse }
  input = input.reverse

  x += 1
end

weight = 0
input.each_with_index do |line, i|
  line.each_with_index do |c, j|
    if c == 'O'
      weight += input.size - i
    end
  end
end

#input.each do |i|
#  puts i
#end
puts weight

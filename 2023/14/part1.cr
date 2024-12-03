#advent of code day 14 part 1

temp = File.read_lines("input")
#input = input.map { |i| i.chars }

input = Array(Array(Char)).new
temp.each do |t|
  input << t.chars
end

#input.each do |i|
#  puts i
#end
#puts " "
weight = 0
(0..input[0].size-1).each do |i|
  rock = input.size
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

#input.each do |i|
#  puts i
#end

puts weight
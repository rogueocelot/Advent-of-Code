# advent of code day 15 part 1

input = File.read("input")
# input.push(",")

sum = 0
temp = 0
# puts input
input.each_char do |c|
  if c == ','
    # puts temp
    sum += temp
    temp = 0
  else
    # puts c.ord
    temp += c.ord
    temp = temp * 17
    temp = temp % 256
  end
end
# puts temp
sum += temp
temp = 0

puts sum

#advent of code part 1 day 1

left = [] of Int32
right = [] of Int32
File.each_line("input.txt") do |line|
    nums = line.split(' ')
    left << nums[0].to_i
    right << nums[-1].to_i
end

left.sort!
right.sort!

sum = 0
(0..left.size-1).each do |i|
    sum += (left[i] - right[i]).abs
end

puts sum
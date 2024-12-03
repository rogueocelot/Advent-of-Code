#advent of code day 2 part 1

sum = 0

File.each_line("input.txt") do |line|
  nums = line.split(' ').map { |i| i.to_i }
  safe = true
  (1..nums.size-1).each do |i|
    if nums[0] > nums[1]
      if nums[i-1] - nums[i] <= 3 && nums[i-1] - nums[i] >= 1
        next
      else
        safe = false
        break
      end
    elsif nums[0] < nums[1]
      if nums[i] - nums[i-1] <= 3 && nums[i] - nums[i-1] >= 1
        next
      else
        safe = false
        break
      end
    else
      safe = false
      break
    end
  end
  sum += 1 if safe == true
end

puts sum
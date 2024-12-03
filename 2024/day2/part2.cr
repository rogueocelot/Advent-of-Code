#advent of code day 2 part 2

sum = 0

File.each_line("input.txt") do |line|
  temp = line.split(' ').map { |i| i.to_i }
  permutation = Array(Array(Int32)).new
  safe = true

  permutation << temp
  (0..temp.size-1).each do |i|
    temp2 = temp.dup
    temp2.delete_at(i)
    permutation << temp2
  end

  permutation.each do |nums|
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
    if safe
      sum += 1
      break
    end
  end

end

puts sum
#advent of code day 5 part 1

sum = 0
firstpart = true
rules = Hash(Int32, Array(Int32)).new

File.each_line("input.txt") do |line|
  if line == ""
    firstpart = false
  elsif firstpart
    #add rules
    temp = line.split('|').map { |i| i.to_i}
    if rules.has_key?(temp[0])
      rules[temp[0]].push(temp[1])
    else
      rules[temp[0]] = [] of Int32
      rules[temp[0]].push(temp[1])
    end

  else
    temp = line.split(',').map { |i| i.to_i }
    before = [] of Int32
    before.push(0)
    valid = true

    temp.each do |num|
      before.each do |x|
        if rules.has_key?(num) && rules[num].includes?(x)
          valid = false
        end
      end
      before.push(num)
    end

    if valid
      sum += temp[(temp.size/2).to_i]
    end

  end
end
#puts rules

puts sum
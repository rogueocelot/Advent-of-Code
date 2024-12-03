
elves = Array.new
temp = 0
File.readlines("input").each do |line|
  if line == "\n"
    elves << temp
    temp = 0
  else
    temp += line.to_i
  end
end
elves << temp if temp > 0

puts elves.max(3).sum
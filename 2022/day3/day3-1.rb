
total = 0

File.readlines("input").each do |line|
  item = ''
  letters = Hash.new{ |h,k| h[k] = [] }
  one, two = line.chars.each_slice(line.size / 2).map(&:join)

  one.each_char do |char|
    letters[char] << char
  end

  two.each_char do |char|
    item = char if letters.key?(char)
  end
  #puts item
  itemval = 0
  itemval = item.ord - 38 if item.ord < 92
  itemval = item.ord - 96 if item.ord > 92
  #puts itemval

  total += itemval
end

puts total
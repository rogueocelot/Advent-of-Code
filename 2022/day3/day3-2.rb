
input = File.readlines("input")
total = 0

input.each_with_index do |line, i|
  if i % 3 == 0
    item = ''
    letters = Hash.new{ |h,k| h[k] = [] }
    letterstwo = Hash.new{ |h,k| h[k] = [] }
    one = input[i].chop!
    two = input[i+1].chop!
    three = input[i+2].chop!

    one.each_char do |char|
      letters[char] << char
    end

    two.each_char do |char|
      letterstwo[char] << char
    end

    three.each_char do |char|
      item = char if letters.key?(char) && letterstwo.key?(char)
    end

    itemval = 0
    itemval = item.ord - 38 if item.ord < 92
    itemval = item.ord - 96 if item.ord > 92
    #puts itemval

    total += itemval
  end
end

puts total
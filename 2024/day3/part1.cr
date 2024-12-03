#advent of code day 3 part 1

sum = 0

input = File.read("input.txt")
stack = [] of Char
stack << ')'

commacount = 0
parenscount = 0

input.each_char do |char|
  if stack[-1] == ')' && char == 'm'
    stack << char
  elsif stack[-1] == 'm' && char == 'u'
    stack << char
  elsif stack[-1] == 'u' && char == 'l'
    stack << char
  elsif stack[-1] == 'l' && char == '('
    stack << char
  elsif stack[-1] == '(' && char.number?
    stack << char
    parenscount += 1
  elsif stack[-1].number? && char.number?
    stack << char
  elsif stack[-1].number? && char == ',' && parenscount > commacount
    stack << char
    commacount += 1
  elsif stack[-1] == ',' && char.number?
    stack << char
  elsif stack[-1].number? && char == ')'
    stack << char
  else
    while stack[-1] != ')'
      stack.pop
    end
  end
end

num1 = String.new
num2 = String.new
stack.shift

first = true

while !stack.empty?
  if stack[0] == '('
    first = true
  elsif stack[0] == ','
    first = false
  elsif stack[0] == ')'
    if num1 != "" && num2 != ""
      sum += num1.to_i * num2.to_i
    end
    num1 = ""
    num2 = ""
  elsif stack[0].number?
    if first
      num1 = num1 + stack[0]
    else
      num2 = num2 + stack[0]
    end
  end
  stack.shift
end

puts sum
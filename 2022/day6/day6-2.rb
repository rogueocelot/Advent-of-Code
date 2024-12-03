
input = File.read("input")
len = 0
lcursor = 0
unique = Hash.new

i = 0
while i <= input.size-1
  if !unique.key?(input[i])
    len += 1
    unique[input[i]] = 1
    i += 1
  else
    len = 0
    lcursor += 1
    i = lcursor
    unique.clear
  end

  if len >= 14
    puts i
    break
  end
end
# advent of code day 15 part 2

input = File.read("input")
input = input + ","

sum = 0
temp = 0
label = String.new
lenses = Array(Array(String)).new(256) { Array(String).new }
# puts input
input.each_char_with_index do |c, i|
  #if "," insert or replace the label
  if c == ','
      lenses[temp].each_with_index do |x, y|
        if x.size >= 2 && label.size >= 2 && x[0..-3] == label[0..-3]
          #puts "matched #{x} with #{label}"
          lenses[temp][y] = label
          label = String.new
          temp = 0
          next
        end
      end
      #if label.size >= 2
      lenses[temp] << label
      label = String.new
      temp = 0
      #end

  #add a space instead of the equals
  elsif c == '='
    label = label + " "
  #remove label
  elsif c == '-'
    #lenses[temp].delete(label)
    lenses[temp].each_with_index do |x, y|
      if x.size >= 1 && label.size >= 1 && x[0..-3] == label
        lenses[temp].delete_at(y)
      end
    end
    label = String.new
  else
    # puts c.ord
    label = label + c
    if !c.number?
      temp += c.ord
      temp = temp * 17
      temp = temp % 256
    end
  end
end

#remove the empty strings
lenses.each_with_index do |x, i|
  x.each_with_index do |y, j|
    if y.size < 2
      lenses[i].delete_at(j)
    end
  end
end

#get sum
lenses.each_with_index do |a, i|
  counter = 1
  a.each_with_index do |s, j|
    if !s.empty?
      sum += (i+1) * counter * s[-1].to_i
      counter += 1
      #puts "#{s}: #{(i+1)} * #{(j+1)} * #{s[-1].to_i} = #{(i+1) * (j+1) * s[-1].to_i}"
    end
  end
end

#print "#{lenses}\n"
temp = 0

puts sum

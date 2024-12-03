
sort = true
stacks = Hash.new{ |h,k| h[k] = []}
File.readlines("input").each do |line|
  if line[1] == '1'
    sort = false
    stacks[1].reverse!
    stacks[2].reverse!
    stacks[3].reverse!
    stacks[4].reverse!
    stacks[5].reverse!
    stacks[6].reverse!
    stacks[7].reverse!
    stacks[8].reverse!
    stacks[9].reverse!
    #puts stacks
  end
  if sort
    #print line[9]
    stacks[1] << line[1] if line[1] =~ /[A-Z]/
    stacks[2] << line[5] if line[5] =~ /[A-Z]/
    stacks[3] << line[9] if line[9] =~ /[A-Z]/
    stacks[4] << line[13] if line[13] =~ /[A-Z]/
    stacks[5] << line[17] if line[17] =~ /[A-Z]/
    stacks[6] << line[21] if line[21] =~ /[A-Z]/
    stacks[7] << line[25] if line[25] =~ /[A-Z]/
    stacks[8] << line[29] if line[29] =~ /[A-Z]/
    stacks[9] << line[33] if line[33] =~ /[A-Z]/
  elsif line[0] == 'm'
    num = line.split(" from ")[0].split(' ')[1].to_i
    from = line.split(" from ")[1].split(' to ')[0].to_i
    to = line.split(" from ")[1].split(' to ')[1].to_i
    num.times do |i|
      stacks[to] << stacks[from].pop
    end
  end
end
#puts stacks
9.times do |i|
  print stacks[i+1].last
end
puts
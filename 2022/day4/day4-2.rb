
total = 0

File.readlines("input").each do |line|
  pairs = line.split(",")
  range1 = pairs[0].split("-").map { |ele| ele.to_i }
  range2 = pairs[1].split("-").map { |ele| ele.to_i }
  #print "#{range1}\n"
  #print "#{range2}\n"
  if (range1[0] <= range2[0] && range1[1] >= range2[0]) || (range2[0] <= range1[0] && range2[1] >= range1[0])
    total += 1
  end
end

puts total
winner = {"A" => "Y", "B" => "Z", "C" => "X"}
draw = {"A" => "X", "B" => "Y", "C" => "Z"}
shapePoints = {"X" => 1, "Y" => 2, "Z" => 3}

total = 0

File.readlines("input").each do |line|
  #in winner hash
  if line[2] == winner[line[0]]
    total += 6
  elsif line[2] == draw[line[0]]
    total += 3
  end

  total += shapePoints[line[2]]

end

puts total
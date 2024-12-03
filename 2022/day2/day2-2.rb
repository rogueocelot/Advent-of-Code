winner = {"A" => "Y", "B" => "Z", "C" => "X"}
draw = {"A" => "X", "B" => "Y", "C" => "Z"}
loser = {"A" => "Z", "B" => "X", "C" => "Y"}
shapePoints = {"X" => 1, "Y" => 2, "Z" => 3}

total = 0

File.readlines("input").each do |line|
  myhand = "N"
  if line[2] == "X"
    myhand = loser[line[0]]
  elsif line[2] == "Y"
    myhand = draw[line[0]]
    total += 3
  elsif line[2] == "Z"
    myhand = winner[line[0]]
    total += 6
  end

  total += shapePoints[myhand]

end

puts total
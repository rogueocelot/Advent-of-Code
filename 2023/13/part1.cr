#advent of code day 13 part 1

def findmirror(mirror)
  rowsabove = 0
  (0..mirror.size-1).reverse_each do |i|
    #if this row matches the next one
    if mirror[i] == mirror[i-1]
      x = 0
      b = 0
      #expand outward making sure the rows match until one side reaches the end
      while i+x <= mirror.size-1 && i-x > 0
        b = 1 if mirror[i+x] != mirror[i-(x+1)]
        break if mirror[i+x] != mirror[i-(x+1)]
        x += 1
      end
      next if b != 0
      return i

    end
  end
  return 0
end

input = File.read_lines("input")

mirror = [] of String
left = 0
above = 0
input.each do |line|
  temp = 0
  #blank line, finished with a mirror
  if line == ""
    #print "#{mirror}\n"
    #vertical reflection
    temp = findmirror(mirror)
    temp *= 100
    #horizontal if temp == 0
    if temp == 0
      #print "horizontal\n"
      mirror = mirror.map { |m| m.chars }
      mirror = mirror.transpose
      temp = findmirror(mirror)
    end
    left += temp
    #empty the mirror
    mirror = [] of String
  else
    mirror << line
  end
end
puts left

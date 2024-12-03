#advent of code day 13 part 2

def before(mirror)
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


def findmirror(mirror)
  rowsabove = 0
  #puts mirror.size-1
  diff = 0
  (0..mirror.size-1).reverse_each do |i|

    #difference between the lines
    linediff = 0
    mirror[i].each_with_index do |c, j|
      linediff += 1 if mirror[i][j] != mirror[i-1][j]
    end

    print "#{mirror[i]} vs #{mirror[i-1]}: #{linediff} (before)\n"
    if linediff <= 1
      #diff += linediff
      x = 0

      while i+x <= mirror.size-1 && i-x > 0
        linediff = 0
        mirror[i+x].each_with_index do |c, j|
          linediff += 1 if mirror[i+x][j] != mirror[i-(x+1)][j]
        end
        print "#{mirror[i+x]} vs #{mirror[i-(x+1)]}: #{linediff}\n"
        diff += linediff
        x += 1
      end
      #puts " "
      #next if b != 0

      #puts i
      puts diff
      if diff == 1 && before(mirror) != i
        puts i
        return i
      end

    end
  end
  puts " "
  return 0
end

#input = File.read_lines("input")
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
    mirror = mirror.map { |m| m.chars }
    temp = findmirror(mirror)
    temp *= 100
    #horizontal if temp == 0
    if temp == 0
      print "horizontal\n"
      mirror = mirror.transpose
      temp = findmirror(mirror)
    end
    puts temp
    left += temp
    #empty the mirror
    mirror = [] of String
  else
    mirror << line
  end
end
puts left

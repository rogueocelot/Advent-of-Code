# advent of code day 12 part 2
# version made for playing around in parallelism
# to compile: crystal build -Dpreview_mt corespart2.cr

def findarr(groups, temp, gcursor, tcursor, chunk)
  # tcursor reached end of temp
  if tcursor == temp.size
    # finished with all of the groups
    if (gcursor == groups.size && chunk == 0)
      return 1
    else
      return 0
    end
  end
  arr = 0_i64
  # ? can be either, so run it recursively as both
  if temp[tcursor] == "." || temp[tcursor] == "?"
    # if theres '.' and we arent in a chunk just increment tcursor
    if chunk == 0
      arr += findarr(groups, temp, gcursor, tcursor + 1, 0)
      # if the ongoing chunk is the correct size and hits a '.', move gcursor to the next number in groups
    elsif gcursor < groups.size && groups[gcursor] == chunk && chunk != 0
      arr += findarr(groups, temp, gcursor + 1, tcursor + 1, 0)
    end
  end
  if temp[tcursor] == "#" || temp[tcursor] == "?"
    # if its '#' and the chunk isnt finished, increment it
    arr += findarr(groups, temp, gcursor, tcursor + 1, chunk + 1)
  end
  arr
end

arr = 0_i64
input = File.read_lines("input")
i = 0
(input.size - 1).times do |i|
  run = 0_i64

  spawn do
    groups = input[i].split(" ")[1].split(",").map { |ele| ele.to_i }
    temp = input[i].split(" ")[0].split("").reject { |ele| ele.empty? }

    # 'unfold' it
    section = temp
    section.push("?")
    temp = section + section + section + section + section
    # remove last '?'
    temp.pop
    # add a period to it so it closes the chunks properly
    temp = temp.push(".")

    section = groups
    groups = section + section + section + section + section

    # print "#{temp}\n"
    # print "#{groups}\n"

    run = findarr(groups, temp, 0, 0, 0)
    arr += run
    puts arr
  end
  # puts arr
end

Fiber.yield
puts arr

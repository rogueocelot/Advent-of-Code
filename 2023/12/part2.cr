# advent of code day 12 part 2

module Cache
  extend self
  @@cached = Hash(Array(Int32), UInt64).new

  def self.cached
    @@cached
  end

  def add(key, value)
    @@cached[key] = value
  end

  def check(key)
    # print "@@cached : #{@@cached}\n"
    # print ":key : #{:key}\n"
    # print "key : #{key}\n"
    if !@@cached.empty? && @@cached.has_key?(key)
      # print "#{key} cached?: #{@@cached.has_key?(key)}, #{@@cached[key]}\n"
      return @@cached[key]
    end
    # print "key not cached\n"
    return -1
  end

  def empty
    @@cached = Hash(Array(Int32), UInt64).new
  end
end

def findarr(groups, temp, gcursor, tcursor, chunk)
  if Cache.check([gcursor, tcursor, chunk]) > -1
    # print "found value for #{[groups, temp, gcursor, tcursor, chunk]} : #{cache.check([groups, temp, gcursor, tcursor, chunk])}\n"
    # print "found it\n"
    return Cache.check([gcursor, tcursor, chunk])
  end
  # tcursor reached end of temp
  if tcursor == temp.size
    # finished with all of the groups
    if (gcursor == groups.size && chunk == 0)
      return 1
    else
      return 0
    end
  end
  arr = 0u64
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
  Cache.add([gcursor, tcursor, chunk], arr)
  arr
end

arr = 0u64
File.read_lines("input").each do |line|
  groups = line.split(" ")[1].split(",").map { |ele| ele.to_i }
  temp = line.split(" ")[0].split("").reject { |ele| ele.empty? }
  # add a period to it so it closes the chunks properly

  section = temp
  section.push("?")
  # temp << '?' << section << '?' << section << '?' << section << '?' << section
  temp = section + section + section + section + section
  # remove last '?'
  temp.pop
  # add a period to it so it closes the chunks properly
  temp = temp.push(".")

  section = groups
  # groups << section << section << section << section
  groups = section + section + section + section + section

  run = 0u64
  run = findarr(groups, temp, 0, 0, 0)
  arr += run
  puts arr
  Cache.empty
end
puts arr

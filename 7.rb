files = {}
folders = ["/"]

wd = [""]

STDIN.read.split("$ ").each do |cmd|
  if cmd[0, 2] == "cd"
    dir = cmd.split("cd")[1].strip
    if dir == "/"
      wd = [""]
    elsif dir == ".."
      wd.pop
    else
      wd << dir
    end
  elsif cmd[0, 2] == "ls"
    lines = cmd.split("\n")
    lines[1..].each do |line|
      size, name = line.split(" ")
      path = wd.join("/") + "/" + name
      if size == "dir"
        folders << path
      else
        files[path] = size.to_i
      end
    end
  end
end

sizes = {}

def get_size(path, files, sizes)
  return sizes[path] if sizes.key?(path)
  size = files.select { |k, _| k.index(path) == 0 }
              .map { |_, v| v }
              .sum
  sizes[path] = size
  size
end

folders = folders.map(&:itself)

# Part 1
puts folders.map { |path| get_size(path, files, sizes) }
            .select { |size| size < 100_000 }
            .sum

# Part 2
space_needed = 30_000_000 - (70_000_000 - get_size("/", files, sizes))
puts folders.map { |path| get_size(path, files, sizes) }
            .select { |size| size >= space_needed }
            .sort
            .first

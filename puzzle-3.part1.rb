def getDirection(c)
  case c
  when '^'
    [0,1]
  when 'v'
    [0,-1]
  when '<'
    [-1,0]
  when '>'
    [1,0]
  else
    [0,0]
  end
end

houses_visited = [[0,0]]
current_location = [0,0]

File.open('inputs/puzzle-3.txt','r') do |maze|
  maze.each_char do |c|
    direction = getDirection(c)

    current_location = [current_location[0] + direction[0], current_location[1] + direction[1]]

    houses_visited << current_location if !houses_visited.include?(current_location)
  end
end
puts "Total Houses Visited: #{houses_visited.count}"



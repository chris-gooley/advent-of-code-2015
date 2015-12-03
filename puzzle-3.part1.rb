houses_visited = [[0,0]]
current_location = [0,0]

File.open('inputs/puzzle-3.txt','r') do |maze|
  maze.each_char do |c|
    current_location = case c
    when '^'
      [current_location[0],current_location[1]+1]
    when 'v'
      [current_location[0],current_location[1]-1]
    when '<'
      [current_location[0]-1,current_location[1]]
    when '>'
      [current_location[0]+1,current_location[1]]
    else
      break
    end
    houses_visited << current_location if !houses_visited.include?(current_location)
  end
end
puts "Total Houses Visited: #{houses_visited.count}"

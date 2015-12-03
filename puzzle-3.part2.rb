houses_visited = [[0,0]]
current_location = {
  santa: [0,0],
  bot: [0,0]
}

move = :santa

File.open('inputs/puzzle-3.txt','r') do |maze|
  maze.each_char do |c|
    cloc = current_location[move]
    current_location[move] = case c
    when '^'
      [cloc[0],cloc[1]+1]
    when 'v'
      [cloc[0],cloc[1]-1]
    when '<'
      [cloc[0]-1,cloc[1]]
    when '>'
      [cloc[0]+1,cloc[1]]
    else
      break
    end
    houses_visited << cloc if !houses_visited.include?(cloc)

    move = move == :santa ? :bot : :santa
  end
end
puts "Total Houses Visited: #{houses_visited.count}"

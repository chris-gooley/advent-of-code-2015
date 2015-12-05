found_strings = []

File.readlines('inputs/puzzle-5.txt').each do |str|
  found_strings << str if str.scan(/[aeiou]/).count >= 3 && str.match(/((\w)\2)/) && !str.match(/(ab|cd|pq|xy)/)
end

puts "Found strings: #{found_strings.count}"

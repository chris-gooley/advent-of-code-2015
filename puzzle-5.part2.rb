found_strings = []

File.readlines('inputs/puzzle-5.txt').each do |str|
  found_strings << str if str.match(/((\w)(\w).*\2\3)/) && str.match(/(\w).\1/)
end

puts "Found strings: #{found_strings.count}"

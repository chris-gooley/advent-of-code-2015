total_wrapping = 0
total_ribbon = 0

File.readlines('inputs/puzzle-2.txt').each do |p|
  dimensions = p.split('x').map(&:to_i)
  wrapping = [2*dimensions[0]*dimensions[1], 2*dimensions[1]*dimensions[2], 2*dimensions[2]*dimensions[0]]
  smallest = wrapping.sort.first/2

  perimeter = dimensions.sort.first(2).map{|x| x*2}.inject(:+)
  total_ribbon += perimeter + dimensions.inject(:*)
  total_wrapping += wrapping.inject(:+) + smallest
end

puts "Total Wrapping Paper: #{total_wrapping}"
puts "Total Ribbon: #{total_ribbon}"

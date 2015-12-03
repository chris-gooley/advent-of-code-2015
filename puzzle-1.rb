str = File.open('inputs/puzzle-1.txt','r').read

puts "Finishes on Floor: #{eval("0#{str.gsub('(','+1').gsub(')','-1')}")}"

inst = str.split('').map{|x| x == '(' ? '+1' : '-1' }
pos = 0

inst.each_with_index do |i, count|
  pos = eval("#{pos}#{i}")
  if pos < 0
    puts "Enters basement on step: #{count+1}"
    break
  end
end

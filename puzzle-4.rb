require 'digest/md5'
key = "yzbqklnj"
count = 1
md5 = Digest::MD5.hexdigest("#{key}#{count}")

while md5.slice(0..4) != "00000"
  count += 1
  md5 = Digest::MD5.hexdigest("#{key}#{count}")
  print "Finding: #{count} - #{md5}\s"
  print "\r"
end

puts "\nPart 1: #{count}"

while md5.slice(0..5) != "000000"
  count += 1
  md5 = Digest::MD5.hexdigest("#{key}#{count}")
  print "Finding: #{count} - #{md5}\s"
  print "\r"
end

puts "\nPart 2: #{count}"


## Had a bit of a crack at threading it but ran into some issues
# Solution 1, using Mutex to check a found variable actually made it slower.
# Solution 2 was a lot faster but was unreliable as sometimes one thread found a
# larger md5 that worked before another thread found the smaller one
# I'd be interested to see a threaded approach that worked well.

# Solution 1: Mutexing a found variable
#found = false
#mutex = Mutex.new
#
#threads = (1..10).map do |i|
#  Thread.new do
#    count = i
#    while true
#      count += 10
#      md5 = Digest::MD5.hexdigest("#{key}#{count}")
#
#      #print "Thread #{i}: #{count} - #{md5}\s"
#      #print "\r"
#
#      mutex.synchronize do
#        if md5.slice(0..5) == "000000"
#          found = count
#          Thread.exit
#        elsif found != false
#          Thread.exit
#        end
#      end
#    end
#  end
#end
#
#threads.map(&:join)
#puts "\n\rFound: #{found}"
#
#

# Solution 2: Halt all threads with an exception once answer is found
#Thread.abort_on_exception = true
#
#threads = (1..10).map do |i|
#  Thread.new(i) do |i|
#    count = i
#    while true
#      count += 10
#      md5 = Digest::MD5.hexdigest("#{key}#{count}")
#
#      if md5.slice(0..5) == "000000"
#        raise "Found: #{count}: md5: #{md5}"
#      end
#    end
#  end
#end
#
#threads.map(&:join)

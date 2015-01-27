require "benchmark"
# puts Benchmark.measure { 1000.times { print "." } }

iterations = 10000000

# b = Benchmark.measure do 
#     for i in 1 .. iterations do 
#         x = i
#     end 
# end

# c = Benchmark.measure do 
#     iterations.times do |i| 
#         x = i
#     end
# end

# puts b
# puts c


Benchmark.bmbm do |bm|
    bm.report("for:") do
        for i in 1..iterations do 
            x = i
        end
    end
    
    bm.report("times:") do 
        iterations.times do |i|
            x = i
        end
    end
end
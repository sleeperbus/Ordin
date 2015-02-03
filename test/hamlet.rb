File.open("hamlet.txt", "r") do |file|
  file.readlines.each_with_index do |line, idx|
    puts "#{idx}\t : #{line}" if line.match("Ham\.")
  end
end

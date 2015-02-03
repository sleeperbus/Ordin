DIRNAME = "/home/ubuntu/workspace/tic_tac_toe"

hash = Dir.glob("#{DIRNAME}/**/*.*").inject({}) do |result, fname|
  ext = File.basename(fname).split(".")[-1].to_s.downcase
  result[ext] ||= [0, 0]
  result[ext][0] += 1
  result[ext][1] += File.size(fname)
  result
end

File.open("file-analysis.txt", "w") do |file|
  hash.each do |arr|
    txt = arr.flatten.join("\t")
    file.puts txt
    puts txt
  end
end
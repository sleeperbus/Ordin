require "open-uri"
BASE_URL = "https://chart.googleapis.com/chart?cht=p&chs=500x300"

rows = File.open("file-analysis.txt", "r") do |file|
  file.readlines.map do |line|
    line.strip.split("\t")
  end
end

[1, 2].each do |idx|
  labels = []
  values = []
  rows.each do |row| 
    labels << row[0]
    values << row[idx]
  end
  url = URI.encode "#{BASE_URL}&chd=t:#{values.join(',')}&chl=#{labels.join('|')}"
  puts url
  
  File.open("file_chart_#{idx}.jpb", "w") do |file|
    file.write(open(url))
  end
end
Dir.glob("*").sort_by { |file| File.size(file) }.reverse
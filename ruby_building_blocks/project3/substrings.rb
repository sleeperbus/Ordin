def substrings(stmt, dictionary)
    result = Hash.new(0)
    words = stmt.split(" ")
    words.each do |word|
        dictionary.each do |dict|
            result[dict] += 1 if word.match dict
        end
    end
    Hash[result.sort_by {|key, value| key}]
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low",
            "own","part","partner","sit"]
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
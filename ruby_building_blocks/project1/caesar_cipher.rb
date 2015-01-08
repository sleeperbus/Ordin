
def caesar_chiper(stmt, shift=0)
  small_chars = ("a".."z").to_a
  big_chars = ("A".."Z").to_a
  small_int = small_chars.collect { |c| c.ord }
  big_int = big_chars.collect { |c| c.ord }

  stmt.collect do |c|
    if (small_chars.include? c) == false && (big_chars.include? c) == false)
      c
    else 
      if small_chars.include? c 
        if c.ord - small_int.min
      elsif big_chars.include? c 
      end
    end
  end
end


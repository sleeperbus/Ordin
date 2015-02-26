def flatten(arr, result = [])
  arr.each do |element|
    if element.is_a? Array
      flatten(element, result)
    else
      result << element
    end
  end
end

roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}

def to_roman(roman_mapping, num)
  result = ""
  roman_mapping.each do |key, value|
    div, mod = num.divmod(key)  
    return if mod == 0
    result += value*div 
    to_roman(roman_mapping, mod)
  end
end
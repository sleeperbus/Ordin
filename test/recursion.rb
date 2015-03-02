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

def to_roman(roman_mapping, num, result = "")
  return result if num == 0
  roman_mapping.keys.each do |divisor|
    quotinent, modulus = num.divmod(divisor)
    result << roman_mapping[divisor] * quotinent
    return to_roman(roman_mapping, modulus, result) if quotinent > 0
  end
end

puts to_roman(roman_mapping, 11343, "")


int_mapping = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}
def to_int(int_mapping, roman, result = 0)
  return result if roman.empty? 
  int_mapping.keys.each do |key|
    if roman.start_with? key 
      result += int_mapping[key] 
      roman.slice!(0, key.length)
      return to_int(int_mapping, roman, result)
    end
  end 
end

puts to_int(int_mapping, "MMCMDCD", 0)
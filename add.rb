def add(numbers)
  return 0 if numbers == ''

  delimiter = ','
  if numbers.start_with?('//')
    delimiter = numbers[2]
    numbers = numbers[3..-1]
  else
    numbers = numbers.gsub("\n", ",")
  end
  numbers = numbers.split(delimiter).map(&:to_i)
  negative_numbers = numbers.select { |number| number < 0 }
  raise "negative numbers not allowed #{negative_numbers.join(', ')}" if negative_numbers.size.positive?

  numbers.sum
end

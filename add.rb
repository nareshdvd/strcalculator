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
  numbers.sum
end

def add(numbers)
  return 0 if numbers == ''

  numbers = numbers.gsub("\n", ",")
  numbers = numbers.split(',').map(&:to_i)

  numbers.sum
end

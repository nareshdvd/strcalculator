def add(numbers)
  return 0 if numbers == ''

  numbers = numbers.split(',').map(&:to_i)

  numbers.sum
end

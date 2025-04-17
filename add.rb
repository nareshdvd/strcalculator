def add(numbers)
  return 0 if numbers == ''

  delimiter = ','
  if numbers.start_with?('//')
    delimiter = numbers[2]
    numbers = numbers[3..-1]
    numbers = numbers.gsub('\\n', "")
  else
    numbers = numbers.gsub('\\n', ",")
  end

  if delimiter == '-'
    numbers = numbers.split(delimiter)
    numbers.each_with_index do |number, inx|
      numbers[inx+1] = "-#{numbers[inx+1]}" if number == ''
    end.reject { |number| number == '' }
    numbers = numbers.map(&:to_i)
  else
    numbers = numbers.split(delimiter).map(&:to_i)
  end

  negative_numbers = numbers.select { |number| number < 0 }
  raise "negative numbers not allowed #{negative_numbers.join(', ')}" if negative_numbers.size.positive?

  numbers.sum
end

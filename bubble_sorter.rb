# Build a method #bubble_sort that takes an array and returns a sorted array.
# It must use the bubble sort methodology (using #sort would be pretty pointless, wouldn’t it?).

### Test 1
# > bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]

def bubble_sort(numbers)
  numbers.length.times do
    numbers.map.with_index do |_num, i|
      if numbers[i + 1] && numbers[i + 1] < numbers[i]
        temp = numbers[i]
        numbers[i] = numbers[i + 1]
        numbers[i + 1] = temp
      end
    end
  end

  puts numbers.to_a
end

puts '**** Test 1 ****'
bubble_sort([4, 3, 78, 2, 0, 2])

### Task
# https://www.theodinproject.com/lessons/ruby-caesar-cipher
# Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string:

### Test 1
# puts caesar_cipher('What a string!', 5)
# => "Bmfy f xywnsl!"

def caesar_cipher(text, shift)
  lower = ('a'..'z').to_a
  upper = ('A'..'Z').to_a
  result = ""

  text.each_char.map do |char|
    if char.match(/[a-zA-Z]/)
      start_pos = char.downcase == char ? lower.find_index(char) : upper.find_index(char)
      result += char.downcase == char ? lower[(start_pos + shift) % 26] : upper[(start_pos + shift) % 26]
    else
      result += char
    end
  end
  return result
end

puts caesar_cipher('What a string!', 5)

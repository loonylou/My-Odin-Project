### Task
# Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. 
# It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.
# Next, make sure your method can handle multiple words:

### Test 1
# dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
# substrings("below", dictionary)
# => { "below" => 1, "low" => 1 }

### Test 2
# > substrings("Howdy partner, sit down! How's it going?", dictionary)
# => { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }

def substrings(input, dictionary)
  results = Hash.new
  
  input.gsub(/\W/, " ").split(" ").each do |word|
    dictionary.select{ |entry| word.include?(entry) }.each do |w|
      results.has_key?(w) ? results[w] += 1 : results[w] = 1
    end
  end
  return results
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts "Test 1:"
puts substrings("below", dictionary)

puts "Test 2:"
puts substrings("Howdy partner, sit down! How's it going?", dictionary)

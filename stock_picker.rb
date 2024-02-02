# profit = sale - price### Task
# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. 
# It should return a pair of days representing the best day to buy and the best day to sell. 
# Days start at 0.
# You need to buy before you can sell
# Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.

### Test 1
# stock_picker([17,3,6,9,15,8,6,1,10])
#                0 1 2 3  4 5 6 7  8  
# => [1,4]  # for a profit of $15 - $3 == $12

def stock_picker(prices)
  best_profits = Hash.new

  prices.each_with_index do |price, index|
    if index < prices.length - 1
      possible_profits = prices.slice(index + 1, prices.length)

      best_sale = possible_profits.max
      best_day = possible_profits.find_index(best_sale) + index + 1
      best_profits[index] = ([(best_sale - price), best_day, price, best_sale])
    end 
  end 
  
  best_option = best_profits.max_by{ |k,v| v }

  puts "Buy for £" + best_option[1][2].to_s + " on day " + best_option[0].to_s
  puts "Sell for £" + best_option[1][3].to_s+ " on day " + best_option[1][1].to_s
  puts "Earn profit of £" + best_option[1][0].to_s
  
  return [best_profits.max_by{ |k,v| v }[0], best_profits.max_by{ |k,v| v }[1][1]]
end

puts "**** Test 1 ****"
puts stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]  # for a profit of $15 - $3 == $12

#initialize array
stockprices = [1,14,33,15,16,100,99,22,3,5,6,1]
puts "Current stock prices are: #{stockprices}"

#function to check min, max, and profit
def get_buy_sell_profit(array)
  buy_sell_stock = array.minmax
  profit = buy_sell_stock[1] - buy_sell_stock[0]
  puts "Buy when the stock is: $#{buy_sell_stock[0]}"
  puts "Sell when the stock is: $#{buy_sell_stock[1]}"
  puts "Expected profit of $#{profit}"
end

#call function on array
get_buy_sell_profit(stockprices)

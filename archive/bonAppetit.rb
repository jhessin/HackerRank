#!/bin/ruby

require 'json'
require 'stringio'

# Complete the bonAppetit function below.
def bonAppetit(bill, k, b)
# bill: an array of integers representing the cost of each item ordered
# k: an integer representing the zero-based index of the item Anna doesn't eat
# b: the amount of money that Anna contributed to the bill
sum = 0
splitSum = 0
billFair = 0
annaFair = 0
bill.each_with_index { |a, i|
  sum += a
  if i == k
    billFair += a
  else
    splitSum += a
  end
}

billFair += splitSum / 2
annaFair += splitSum / 2

if annaFair == b
  puts 'Bon Appetit'
else
  puts b - annaFair
end

end

nk = gets.rstrip.split

n = nk[0].to_i

k = nk[1].to_i

bill = gets.rstrip.split.map(&:to_i)

b = gets.strip.to_i

bonAppetit bill, k, b

#!/bin/ruby
# frozen_string_literal: true

def clamp(num1, num2, limit)
  result = num1 + num2
  if result <= limit
    result
  else
    -1
  end
end

def get_max(num1, num2)
  if num1 > num2
    num1
  else
    num2
  end
end

# Complete the getMoneySpent function below.
# keyboards: an array of integers representing keyboard prices
# drives: an array of integers representing drive prices
# budget: How much is in the budget
# returns: The maximum total price of a keyboard and mouse, or -1 if it cannot
# be afforded.
#
def get_money_spent(keyboards, drives, budget)
  # Write your code here.
  maximum = -1
  keyboards.each do |keyboard|
    drives.each do |drive|
      maximum = get_max(maximum, clamp(keyboard, drive, budget))
    end
  end
  maximum
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

bnm = gets.rstrip.split

b = bnm[0].to_i

n = bnm[1].to_i

m = bnm[2].to_i

keyboards = gets.rstrip.split(' ').map(&:to_i)

drives = gets.rstrip.split(' ').map(&:to_i)

#
# The maximum amount of money she can spend on a keyboard and USB drive,
# or -1 if she can't purchase both items
#

money_spent = get_money_spent keyboards, drives, b

fptr.write money_spent
fptr.write "\n"

fptr.close

#!/bin/ruby
# frozen_string_literal: true

#
# Complete the getMoneySpent function below.
#
def get_money_spent(keyboards, drives, currency)
  #
  # Write your code here.
  #
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

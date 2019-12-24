#!/bin/env ruby
# frozen_string_literal: false

def minimum(num1, num2)
  if num1 < num2
    num1
  else
    num2
  end
end

#
# Complete the pageCount function below.
#
# pageCount has the following parameter(s):
#
# n: the number of pages in the book
# p: the page number to turn to
# returns: the minimum number of pages that must be turned
def page_count(n, p) # rubocop:disable Naming/MethodParameterName
  return 0 if p == 1 || p == n || (n.odd? && p == n - 1)

  fromstart = p / 2
  fromend = (n - p) / 2
  fromend = 1 if fromend.zero?
  minimum fromstart, fromend
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

p = gets.to_i

result = page_count n, p

fptr.write result
fptr.write "\n"

fptr.close

#!/bin/ruby
# frozen_string_literal: true

require 'json'
require 'stringio'

# Complete the sockMerchant function below.
def sockMerchant(_n, ar)
  # n: the number of socks in the pile
  # ar: the colors of each sock
  # output: number of matching pairs of socks
  socks = {}
  ar.each do |sock|
    if socks.key? sock
      socks[sock] += 1
    else
      socks[sock] = 1
    end
  end

  count = 0
  socks.each_value do |sock|
    count += sock / 2
  end
  count
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

ar = gets.rstrip.split(' ').map(&:to_i)

result = sockMerchant n, ar

fptr.write result
fptr.write "\n"

fptr.close

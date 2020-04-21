#!/bin/ruby
# frozen_string_literal: true

require 'json'
require 'stringio'

# add_sock adds 1 to a hash if the key exists, otherwise adds the key and sets
# it to 1
# socks: A hash of sock pairs
# sock: the sock being added to the hash
# returns: The modified hash
def add_sock(socks, sock)
  if socks.key? sock # if the key exists
    socks[sock] += 1 # increment the hash
  else
    socks[sock] = 1  # otherwise add the key and set it to 1
  end
end

# sock_merchant is a simple function to calculate the number of sock pairs
# given a pile of socks and their colors
# n: the number of socks in the pile
# ar: the colors of each sock
# output: number of matching pairs of socks
def sock_merchant(_number_of_socks, sock_list)
  # Initialize an empty hash of socks
  sock_pairs = {}

  # Iterate through the sock list
  sock_list.each do |sock|
    sock_pairs = add_sock sock_pairs, sock
  end

  # Initialize a counter to count the number of pairs
  count = 0

  # Iterate over the sock_pairs hash to find how many pairs of socks there are.
  sock_pairs.each_value do |sock|
    count += sock / 2 # It is only a pair if there are two.
  end

  # return the count
  count
end

## The following is HackerRank specific code.
fptr = File.open(ENV['OUTPUT_PATH'], 'w')
n = gets.to_i
ar = gets.rstrip.split(' ').map(&:to_i)

result = sock_merchant n, ar

fptr.write result
fptr.write "\n"

fptr.close

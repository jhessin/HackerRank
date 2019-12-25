#!/bin/env ruby
# frozen_string_literal: false

require 'json'
require 'stringio'

# Hike: Holds info about the hike
class Hike
  @elevation = 0
  @history = [0]
  def initialize
    @elevation = 0
    @history = [0]
  end

  def move_string(str)
    str.each_char do |char|
      move char
    end
  end

  def move(char)
    case char.upcase
    when 'U'
      @elevation += 1
      @history.push @elevation
    when 'D'
      @elevation -= 1
      @history.push @elevation
    end
  end

  def valley_count
    count = 0
    prev = 0
    @history.each do |elevation|
      count += 1 if elevation.zero? && prev == -1
      prev = elevation
    end
    count
  end
end

# Complete the countingValleys function below.
def counting_valleys(_count, string)
  hike = Hike.new

  hike.move_string string

  hike.valley_count
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

s = gets.to_s.rstrip

result = counting_valleys n, s

fptr.write result
fptr.write "\n"

fptr.close

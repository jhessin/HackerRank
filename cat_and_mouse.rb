#!/bin/ruby
# frozen_string_literal: true

require 'json'
require 'stringio'

# Complete the catAndMouse function below.
def cat_and_mouse(cat_a, cat_b, mouse_c)
  delta_a = (cat_a - mouse_c).abs
  delta_b = (cat_b - mouse_c).abs

  if delta_a < delta_b
    'Cat A'
  elsif delta_b < delta_a
    'Cat B'
  else
    'Mouse C'
  end
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

q = gets.to_i

q.times do |_q_itr|
  xyz = gets.rstrip.split

  x = xyz[0].to_i

  y = xyz[1].to_i

  z = xyz[2].to_i

  result = cat_and_mouse x, y, z

  fptr.write result
  fptr.write "\n"
end

fptr.close

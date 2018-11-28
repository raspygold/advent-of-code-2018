#!/usr/bin/env ruby

class Solution
  require_relative "../solvable"
  include Solvable

  define_solution :part1 do |input|
    # implementation
  end

  define_solution :part2 do |input|
    # implementation
  end
end

solution = Solution.new
# test scenarios using the samples provided
solution.test(:part1, "test input", "expected result")
solution.test(:part2, "test input", "expected result")
puts "-"*20
# produce the solution using the challenge input
solution.solve(:part1, "input")
solution.solve(:part2, "input")
